{ ... }:

{
  programs.uv = {
    enable = true;
    settings = {
      index = [
        {
          default = true;
          url = "https://pypi.tuna.tsinghua.edu.cn/simple";
        }
      ];
    };
  };
}
