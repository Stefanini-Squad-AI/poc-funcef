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

    // Baixa de Documento
    0 : begin
          Lst.Add('Nº do Documento');
          Lst.Add('Complemento');
          Lst.Add('Razão Social');
          Lst.Add('Descrição do Lançamento'); //- Marcio Motta - 17317 - 25/04/2005
          Lst.Add('Nº do Cheque\Borderô');
          Lst.Add('Nº do SLIP');
//          Lst.Add('Nº da Ordem de Pago'); andre tavares - 17317 - isso nao é necessário
          Lst.Add('Histórico Complementar');
{  andre tavares - 17317 - isso nao é necessário
          Lst.Add('Portador Forma');
          Lst.Add('Portador Conta');
          Lst.Add('Nº do Recibo de Pagamento');
          Lst.Add('Nº Lote');                   // Marcio Motta - 17317 - 25/04/2005
          Lst.Add('Nº AP');                     // Marcio Motta - 17317 - 25/04/2005
}
        end;

    // Lançamento de Documentos & Estorno de Lançamento
    1, 3: begin
            Lst.Add('Nº do Documento');
            Lst.Add('Complemento');
            Lst.Add('Razão Social');
            // Lst.Add('Descrição do Lançamento'); - Marcio Motta - 17317 - 22/04/2005
            Lst.Add('Data de Vencimento');
            Lst.Add('Data Programada');           // Marcio Motta - 17317 - 22/04/2005
            Lst.Add('Histórico Complementar');
            Lst.Add('Tipo de Documento');
            Lst.Add('Nº AP');                     // Marcio Motta - 17317 - 22/04/2005
          end;

    // Lançamento de Alteradores
    2: begin
         Lst.Add('Nome do Alterador');         // Marcio Motta - 17317 - 25/04/2005
         Lst.Add('Nº do Documento');
         Lst.Add('Complemento');
         Lst.Add('Razão Social');
         // Lst.Add('Descrição do Lançamento'); - Marcio Motta - 17317 - 25/04/2005
         Lst.Add('Histórico Complementar');
         Lst.Add('Nº AP');                     // Marcio Motta - 17317 - 25/04/2005
       end;

    // Marcio Motta - 17317 - 25/04/2005
     4: //Baixa Lote,
     begin
    //    Lst.Add('Favorecido');
        Lst.Add('Nº do Cheque\Borderô');
        Lst.Add('Nº do Ordem de Pago');
     end;

    //início - andre tavares - pendência 21317 - Reversão de antecipação (baixa de documentos)
     5 : begin
          Lst.Add('Nº do Documento');
          Lst.Add('Complemento');
          Lst.Add('Razão Social');
          Lst.Add('Descrição do Lançamento');
          Lst.Add('Nº do Cheque\Borderô');
          Lst.Add('Nº do SLIP');
          Lst.Add('Histórico Complementar');
        end;
    //fim - andre tavares - pendência 21317 - Reversão de antecipação (baixa de documentos)
    
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
