unit uListaCamposHistCapCar;

interface

uses Classes, uCtrlModeloHistorico;

procedure SetListaCamposHistCapCar(iTipo: Integer; Lst: TStrings; IdModulo: Integer);
Function GetHistoricoCapCar( Obj         : TCtrlModeloHistorico;
                            IdPessoa    : Double;
                            IdModulo    : Integer;
                            Tipo        : Integer;
                            HistDefault : String;
                            Args        : Array of String ) : String;


implementation

procedure SetListaCamposHistCapCar(iTipo: Integer; Lst: TStrings; IdModulo: Integer);
begin
  Lst.Clear;

  Case iTipo of
    0, 3: //Baixa de Documento
    begin
        Lst.Add('Nº do Documento');
        Lst.Add('Complemento');
        Lst.Add('Razão Social');
        Lst.Add('Descrição do Lançamento');
        Lst.Add('Nº do Cheque\Borderô');
        Lst.Add('Nº do SLIP');
        Lst.Add('Nº do Ordem de Pago');
        Lst.Add('Histórico Complementar');
    end;
    1: //Lançamento de Documentos
    begin
        Lst.Add('Nº do Documento');
        Lst.Add('Complemento');
        Lst.Add('Razão Social');
        Lst.Add('Descrição do Lançamento');
        Lst.Add('Data de Vencimento');
        Lst.Add('Histórico Complementar');
    end;
    2: //Lançamento de Alteradores
    begin
        Lst.Add('Nº do Documento');
        Lst.Add('Complemento');
        Lst.Add('Razão Social');
        Lst.Add('Descrição do Lançamento');
        Lst.Add('Histórico Complementar');
    end;
    4:
    begin
        Lst.Add('Favorecido');
        Lst.Add('Nº do Cheque\Borderô');
        Lst.Add('Nº do Ordem de Pago');
    end;
  end;
end;

Function GetHistoricoCapCar( Obj         : TCtrlModeloHistorico;
                            IdPessoa    : Double;
                            IdModulo    : Integer;
                            Tipo        : Integer;
                            HistDefault : String;
                            Args        : Array of String ) : String;
Var
   x : Integer;
begin
   //Pega a lista de Campos referente ao tipo de Modelo
   SetListaCamposHistCapCar( Tipo, Obj.FieldNames, IdModulo );

   //Prenche os valores referente aos campos da lista
   Obj.FieldValues.Clear;

   For x:= 0 To High( Args ) Do
       Obj.FieldValues.add( Args[x] );

   Result := Obj.GetHistorico(Trunc(IdPessoa),IdModulo,Tipo,HistDefault);
End;

end.
