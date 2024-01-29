import promptAction from '@ohos.promptAction';

export function useToast(msg: string) {
  try {
    promptAction.showToast({
      message: msg,
      duration: 2000,
      bottom: 380
    });
  } catch (error) {
    console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
  };
}
