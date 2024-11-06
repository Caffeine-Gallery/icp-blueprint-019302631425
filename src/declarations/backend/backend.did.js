export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'getSpecification' : IDL.Func([], [IDL.Text], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
