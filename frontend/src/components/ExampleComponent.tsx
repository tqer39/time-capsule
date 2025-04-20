import { useEffect, useState } from 'react';

const ExampleComponent = () => {
  const [isClient, setIsClient] = useState(false);

  useEffect(() => {
    setIsClient(true); // クライアントサイドでのみ実行
  }, []);

  if (!isClient) {
    return null; // サーバーサイドでは何もレンダリングしない
  }

  return <div>クライアントサイドでのみ表示されるコンテンツ</div>;
};

export default ExampleComponent;
