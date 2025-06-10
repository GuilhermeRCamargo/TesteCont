unit Model.Interfaces.IEnderecoProvider;

interface

uses Model.Entities.TEndereco;

type
  IEnderecoProvider = interface
    ['{45B06684-07BD-458B-8F99-4492AF1640D5}']
    function Buscar(const ACEP: string): TEndereco;
  end;

implementation

end.
