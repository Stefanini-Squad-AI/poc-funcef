unit uListaCamposHistCapCar;

interface

uses Classes, uCtrlModeloHistorico, Sysutils, dbclient;

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
          Lst.Add('Descrição do Lançamento');
          Lst.Add('Nº do Cheque\Borderô');
          Lst.Add('Nº do SLIP');
          Lst.Add('Histórico Complementar');
          Lst.Add('Nº AP/GR');
          Lst.Add('Nº do LOTE');
        end;

    // Lançamento de Documentos
    1 : begin
            Lst.Add('Nº do Documento');
            Lst.Add('Complemento');
            Lst.Add('Razão Social');
            Lst.Add('Data de Vencimento');
            Lst.Add('Data Programada');
            Lst.Add('Histórico Complementar');
            Lst.Add('Tipo de Documento');
            Lst.Add('Nº AP/GR');
          end;

    // Lançamento de Alteradores
    2: begin
         Lst.Add('Nome do Alterador');
         Lst.Add('Nº do Documento');
         Lst.Add('Complemento');
         Lst.Add('Razão Social');
         Lst.Add('Histórico Complementar');
         Lst.Add('Nº AP/GR');
       end;

    // Estorno de Lançamento
     3: begin
          Lst.Add('Nº do Documento');
          Lst.Add('Complemento');
          Lst.Add('Razão Social');
          Lst.Add('Data de Vencimento');
          Lst.Add('Data Programada');
          Lst.Add('Histórico Complementar');
          Lst.Add('Tipo de Documento');
          Lst.Add('Nº AP/GR');
          Lst.Add('Nº do LOTE');
        end;

     4: // Baixa Lote
     begin
       Lst.Add('Nº do Cheque\Borderô');
       Lst.Add('Nº do Ordem de Pagto');
       Lst.Add('Nº do LOTE');
     end;

     5 : begin
          Lst.Add('Nº do Documento');
          Lst.Add('Complemento');
          Lst.Add('Razão Social');
          Lst.Add('Descrição do Lançamento');
          Lst.Add('Nº do Cheque\Borderô');
          Lst.Add('Nº do SLIP');
          Lst.Add('Histórico Complementar');
          Lst.Add('Nº do LOTE');
        end;
  end;
end;



function GetHistoricoCapCar( Obj         : TCtrlModeloHistorico;
                            IdPessoa    : Double;
                            IdModulo    : Integer;
                            Tipo        : Integer;
                            HistDefault : String;
                            Args        : Array of String ) : String;
Var
   x : Integer;

  _ListaHistorico: TStrings;

  function GetHistorico(iIdPessoa, iIdModulo, iTipo: Integer; sHistoricoDefaul: String; iIdHistorico: Integer = 0): String;
  Var
    X: Integer;
    sHistorico, sItem, sConteudo: String;
    cds: TClientDataSet;
  begin

    cds := TClientDataSet.Create(nil);
    try
      if Trim(sHistoricoDefaul) = '' then raise Exception.Create('Histórico Padrão Não Informado.');

      sHistorico := '';
      sConteudo  := '';
      if iIdHistorico = 0 then
         Cds.Data := Obj.GetDataPacket(' SELECT COMPOHISTORICO FROM MODELOHISTORICO WHERE ' +
                                    ' (IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
                                    ' (IDMODULO = ' + IntToStr(iIdModulo) + ') AND ' +
                                    ' (TIPO = ' + IntToStr(iTipo) + ') AND ' +
                                    ' (STATUS = ''A'') ')
      else
         Cds.Data := Obj.GetDataPacket(' SELECT COMPOHISTORICO FROM MODELOHISTORICO WHERE ' +
                                    ' (IDMODELOHISTORICO = ' + IntToStr(iIdHistorico) + ')');

      if Not Cds.IsEmpty then
      begin
         _ListaHistorico.Text := Cds.Fields[0].AsString;
         Cds.Close;

         For X:=0 To _ListaHistorico.Count - 1 Do
         Begin
           sItem := _ListaHistorico[x];

           if (sItem[1] = '#') OR (sItem[1] = '&') then
           begin
               sHistorico := sHistorico + ' ' + Copy(sItem,2,Length(sItem));
               sItem := '';
           end;

           If sItem <> '' Then
           Begin
             if x <= _ListaHistorico.Count - 1 then
               try
                 if Obj.FieldNames.indexOf(_ListaHistorico[x]) < Obj.FieldValues.Count then
                   sConteudo := Obj.FieldValues[Obj.FieldNames.indexOf(_ListaHistorico[x])];
               except
                 sConteudo := '';
               end
             else
               sConteudo := '';
           End;

         If sItem <> '' Then
            sHistorico :=  sHistorico + ' ' + sConteudo;
         End;

      end
      else

      if trim(sHistorico) = '' then
         sHistorico := sHistoricoDefaul;

    finally
      cds.Free;
      result := Trim(sHistorico);
    end;
  end;

begin
   _ListaHistorico := TStringList.Create;

   // Pega a lista de Campos referente ao tipo de Modelo
   SetListaCamposHistCapCar( Tipo, Obj.FieldNames, IdModulo );

   // Prenche os valores referente aos campos da lista
   Obj.FieldValues.Clear;

   For x:= 0 To High( Args ) Do
   begin
     if trim(Args[x]) = '' then
       Obj.FieldValues.add(' ')
     else
       Obj.FieldValues.add( Args[x] );
   end;

   Result := GetHistorico(Trunc(IdPessoa),IdModulo,Tipo,HistDefault);
  _ListaHistorico.Free;
End;



end.
