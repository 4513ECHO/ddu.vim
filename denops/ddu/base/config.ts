import { ContextBuilder } from "../context.ts";
import { DduExtType } from "../types.ts";
import { Denops } from "../deps.ts";

export type ConfigArguments = {
  denops: Denops;
  contextBuilder: ContextBuilder;
  setAlias: (extType: DduExtType, alias: string, base: string) => void;
};

export abstract class BaseConfig {
  apiVersion = 1;

  async config(_args: ConfigArguments): Promise<void> {}
}
