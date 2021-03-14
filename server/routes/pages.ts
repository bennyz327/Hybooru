import PromiseRouter from "express-promise-router";
import * as postsController from "../controllers/posts";
import * as statsController from "../controllers/stats";
import { IndexPageData, PostsSearchRequest, SearchPageData } from "./apiTypes";

export const router = PromiseRouter();

router.get<any, any, any, PostsSearchRequest>('/posts', async (req, res) => {
  const results = await postsController.search(req.query.query, req.query.page, !req.query.page);
  const search = req.query.query;
  
  res.react<SearchPageData>({ results, search });
});

router.get('/', async (req, res) => {
  const stats = await statsController.getStats();
  
  res.react<IndexPageData>({ stats });
});
