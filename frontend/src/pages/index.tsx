import { GetServerSideProps } from 'next';

export const getServerSideProps: GetServerSideProps = async () => {
  const data = await fetch('https://api.example.com/data').then((res) =>
    res.json(),
  );
  return { props: { data } };
};

const HomePage = ({ data }: { data: any }) => {
  return <div>{JSON.stringify(data)}</div>;
};

export default HomePage;
