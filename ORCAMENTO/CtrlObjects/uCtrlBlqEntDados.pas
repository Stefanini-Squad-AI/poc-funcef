unit uCtrlBlqEntDados;
{*******************************************************}
{ Analista Responsável: Rodolpho da Silva               }
{ Criado em 02/08/2007                                  }
{                                                       }
{*******************************************************}


interface

uses
  Classes, DB, uDataBase, uCmControlObject, dbclient, sysutils,
  uCMTypes, uCMClientDataSet, uDbBlqentdados, uDbDetBlqentdados;

type
  TCtrlBlqEntDados = class(TCmControlObject)

  protected

    procedure DoChangeDataBase;  Override;
    procedure OnCreateAppServer; Override;

  private

    DbBlqentdados: TDbBlqentdados;
    DbDetBlqentdados: TDbDetblqentdados;

    FCds: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
    FCdsCRespon: TCMClientDataSet;
    FCdsCenarios: TCMClientDataSet;
    FCdsUsuarios: TCMClientDataSet;
    procedure SetCds(const Value: TCMClientDataSet);
    procedure SetCdsDet(const Value: TCMClientDataSet);
    procedure SetCdsCenarios(const Value: TCMClientDataSet);
    procedure SetCdsCRespon(const Value: TCMClientDataSet);
    procedure SetCdsUsuarios(const Value: TCMClientDataSet);

  public
    property Cds        : TCMClientDataSet read FCds         write SetCds;
    property CdsDet     : TCMClientDataSet read FCdsDet      write SetCdsDet;
    property CdsCenarios: TCMClientDataSet read FCdsCenarios write SetCdsCenarios;
    property CdsCRespon : TCMClientDataSet read FCdsCRespon  write SetCdsCRespon;
    property CdsUsuarios: TCMClientDataSet read FCdsUsuarios write SetCdsUsuarios;

    Constructor Create; Override;
    Destructor  Destroy;Override;

    procedure Seleciona(iIdBlqEntDados: integer = -1);
    procedure SelecionaUsuxCRespon(iIdBlqEntDados: integer = -1);
    function AplicaAlteracoes: boolean;
    function ExcluirRegistros: boolean;
    function TestaEntDadosBlq(iIdUsuario, iIdEmpresa, iPeriodo, iExercicio: integer; iIdCenario: integer = -1): boolean;


  end;


implementation




procedure TCtrlBlqEntDados.OnCreateAppServer;
Begin
  Inherited;
End;



Procedure TCtrlBlqEntDados.DoChangeDataBase;
Begin
  Inherited;
  DbBlqentdados.DataBaseName    := DataBaseName;
  DbDetBlqentdados.DataBaseName := DataBaseName;
End;



Constructor TCtrlBlqEntDados.Create;
Begin
  Inherited;
  DbBlqentdados    := TDbBlqentdados.Create(self);
  DbDetBlqentdados := TDbDetblqentdados.Create(self);
End;



Destructor TCtrlBlqEntDados.Destroy;
Begin
  FreeAndNil(DbBlqentdados);
  FreeAndNil(DbDetBlqentdados);
  Inherited;
End;



procedure TCtrlBlqEntDados.SetCds(const Value: TCMClientDataSet);
begin
  FCds := Value;
end;




procedure TCtrlBlqEntDados.SetCdsDet(const Value: TCMClientDataSet);
begin
  FCdsDet := Value;
end;




procedure TCtrlBlqEntDados.Seleciona(iIdBlqEntDados: integer = -1);
var
  sSQL: string;
begin
   Cds.Data := GetDataPacket('SELECT ' +
                             '   IDBLQENTDADOS, ' +
                             '   PERIODO, ' +
                             '   EXERCICIO ' +
                             'FROM ' +
                             '   BLQENTDADOS ' +
                             'WHERE ' +
                             '   IDBLQENTDADOS = ' + IntToStr(iIdBlqEntDados));

   CdsDet.Data := GetDataPacket('SELECT ' +
                                '   IDDETBLQENTDADOS, ' +
                                '   IDBLQENTDADOS, ' +
                                '   IDCENARIOORCAMEN, ' +
                                '   CODCENTRORESPON, ' +
                                '   IDPESSOA, ' +
                                '   IDPESSOAACESSO ' +
                                'FROM ' +
                                '   DETBLQENTDADOS ' +
                                'WHERE ' +
                                '   IDBLQENTDADOS = ' + IntToStr(iIdBlqEntDados));

  sSQL := 'SELECT ' +
          '  ''S'' AS VALIDA, ' +
          '  DECODE(D.IDCENARIOORCAMEN,C.IDCENARIOORCAMEN,''S'',''N'') AS SELECIONA, ' +
          '  C.IDCENARIOORCAMEN, ' +
          '  C.NOMECENARIO ' +
          'FROM ' +
          '  CENARIOORCAMEN C, ' +
          '  (SELECT IDCENARIOORCAMEN ' +
          '   FROM DETBLQENTDADOS ';

          if iIdBlqEntDados <> -1 then
             sSQL := sSQL + '  WHERE IDBLQENTDADOS = ' + IntToStr(iIdBlqEntDados);

          sSQL := sSQL + ') D ' +
          'WHERE C.IDCENARIOORCAMEN = D.IDCENARIOORCAMEN(+) ' +
          'ORDER BY ' +
          '  C.NOMECENARIO ';
  CdsCenarios.Data := GetDataPacket(sSQL);



  sSQL := 'SELECT ' +
          '  ''S'' AS VALIDA, ' +
          '  DECODE(D.CODCENTRORESPON,NULL,''N'', ' +
          '         DECODE(D.TOTUSUS,P.TOTUSUC,''S'', ' +
          '                DECODE(SIGN(D.TOTUSUS),0,''S'',''N'' ' +
          '                      ) ' +
          '               ) ' +
          '        ) AS SELECIONA, ' +
          '  C.IDPESSOA, ' +
          '  C.CODCENTRORESPON, ' +
          '  C.NOME ' +
          'FROM ' +
          '  CENTRESPON C, ' +
          '  (SELECT CODCENTRORESPON, COUNT(IDPESSOAACESSO) AS TOTUSUS ' +
          '   FROM DETBLQENTDADOS ';

          if iIdBlqEntDados <> -1 then
             sSQL := sSQL + '  WHERE IDBLQENTDADOS = ' + IntToStr(iIdBlqEntDados);

          sSQL := sSQL +
          '   GROUP BY CODCENTRORESPON) D, ' +
          '  (SELECT CODCENTRORESPON, COUNT(CODCENTRORESPON) AS TOTUSUC ' +
          '   FROM PESSOAXCRESP ' +
          '   GROUP BY CODCENTRORESPON)  P ' +


          'WHERE (C.CODCENTRORESPON = D.CODCENTRORESPON(+)) ' +
          '  AND (C.CODCENTRORESPON = P.CODCENTRORESPON(+)) ' +
          '  AND (C.ATIVO = ''S'') ' +
          'ORDER BY ' +
          '  C.NOME ';
  CdsCRespon.Data := GetDataPacket(sSQL);
end;




procedure TCtrlBlqEntDados.SetCdsCenarios(const Value: TCMClientDataSet);
begin
  FCdsCenarios := Value;
end;




procedure TCtrlBlqEntDados.SetCdsCRespon(const Value: TCMClientDataSet);
begin
  FCdsCRespon := Value;
end;




procedure TCtrlBlqEntDados.SetCdsUsuarios(const Value: TCMClientDataSet);
begin
  FCdsUsuarios := Value;
end;




procedure TCtrlBlqEntDados.SelecionaUsuxCRespon(iIdBlqEntDados: integer = -1);
var
  sSQL: string;
begin
   sSQL := 'SELECT ' +
           '  ''S'' AS VALIDA, ' +
           '  DECODE(D.IDPESSOAACESSO,PXC.IDPESSOAACESSO,''S'',''N'') AS SELECIONA, ' +
           '  PXC.CODCENTRORESPON, ' +
           '  PXC.IDPESSOAACESSO, ' +
           '  PXC.IDPESSOA, ' +
           '  P.NOME ' +
           'FROM ' +
           '  PESSOAXCRESP PXC, ' +
           '  (SELECT CODCENTRORESPON, IDPESSOAACESSO ' +
           '   FROM DETBLQENTDADOS ';

           if iIdBlqEntDados <> -1 then
              sSQL := sSQL + '  WHERE IDBLQENTDADOS = ' + IntToStr(iIdBlqEntDados);

           sSQL := sSQL + ') D, ' +
           '  PESSOA P ' +
           'WHERE (PXC.IDPESSOAACESSO  = D.IDPESSOAACESSO(+)) ' +
           '  AND (PXC.CODCENTRORESPON = D.CODCENTRORESPON(+)) ' +
           '  AND (PXC.IDPESSOAACESSO  = P.IDPESSOA) ' +
           'ORDER BY ' +
           '  P.NOME ';
  CdsUsuarios.Data := GetDataPacket(sSQL);
end;




function TCtrlBlqEntDados.AplicaAlteracoes: boolean;
begin
   try
      StartTransaction;

      //Verifica se já existe um período bloqueado
      _Cds.Data := GetDataPacket('SELECT IDBLQENTDADOS ' +
                                 'FROM BLQENTDADOS ' +
                                 'WHERE PERIODO   = ' + Cds.FieldByName('PERIODO').AsString +
                                 '  AND EXERCICIO = ' + Cds.FieldByName('EXERCICIO').AsString +
                                 '  AND IDBLQENTDADOS <> ' + IntToStr(Cds.FieldByName('IDBLQENTDADOS').AsInteger));
      if not _Cds.IsEmpty then
         raise Exception.Create('O período ' + Cds.FieldByName('PERIODO').AsString + '/' +
                                Cds.FieldByName('EXERCICIO').AsString + ' já está bloqueado.');


      // Aplica as alterações na tabela pai
      Result := ApplyCds(Cds,DbBlqentdados,[],[]);
      if not Result then
         raise Exception.Create(DbBlqentdados.MessageInfo);

      // Exclui todos os registros da tabela filho, para remonta-los
      CdsDet.First;
      while not CdsDet.Eof do
         CdsDet.Delete;

      // Aplica as alterações de cenários
      CdsCenarios.First;
      while not CdsCenarios.Eof do
      begin
         if CdsCenarios.FieldByName('SELECIONA').AsString = 'S' then
         begin
            CdsDet.Append;
            CdsDet.FieldByName('IDCENARIOORCAMEN').AsInteger := CdsCenarios.FieldByName('IDCENARIOORCAMEN').AsInteger;
            CdsDet.Post;
         end;
         CdsCenarios.Next;
      end;

      // Aplica as alterações do C.Respon
      CdsCRespon.DisableControls;
      CdsUsuarios.DisableControls;
      CdsCRespon.First;
      while not CdsCRespon.Eof do
      begin
         // Se o C.Respon estiver selecionado, inclui-o no CdsDet
         if CdsCRespon.FieldByName('SELECIONA').AsString = 'S' then
         begin
            CdsDet.Append;
            CdsDet.FieldByName('IDPESSOA').AsInteger       := CdsCRespon.FieldByName('IDPESSOA').AsInteger;
            CdsDet.FieldByName('CODCENTRORESPON').AsString := CdsCRespon.FieldByName('CODCENTRORESPON').AsString;
            CdsDet.Post;
         end
         else
         begin
             // Se o C.Respon não estiver selecionado,
             //verifica se existe usuários do C.Respon selecionados.
             //Se tiver, inclui-os
             CdsUsuarios.Filtered := false;
             CdsUsuarios.Filter   := 'CODCENTRORESPON = ' + QuotedStr(CdsCRespon.FieldByName('CODCENTRORESPON').AsString);
             CdsUsuarios.Filtered := true;

             CdsUsuarios.First;
             while not CdsUsuarios.Eof do
             begin
                if CdsUsuarios.FieldByName('SELECIONA').AsString = 'S' then
                begin
                   CdsDet.Append;
                   CdsDet.FieldByName('IDPESSOA').AsInteger       := CdsCRespon.FieldByName('IDPESSOA').AsInteger;
                   CdsDet.FieldByName('IDPESSOAACESSO').AsInteger := CdsUsuarios.FieldByName('IDPESSOAACESSO').AsInteger;
                   CdsDet.FieldByName('CODCENTRORESPON').AsString := CdsUsuarios.FieldByName('CODCENTRORESPON').AsString;
                   CdsDet.Post;
                end;
                CdsUsuarios.Next;
             end;
         end;

         CdsCRespon.Next;
      end;

      CdsCRespon.EnableControls;
      CdsUsuarios.EnableControls;


      // Aplica as alterações na tabela filho
      Result := ApplyCds(CdsDet,DbDetBlqentdados,[DbBlqentdados.Idblqentdados],[DbDetBlqentdados.Idblqentdados]);
      if not Result then
         raise Exception.Create(DbDetBlqentdados.MessageInfo);

      Commit;

      // Após confirmar a operação, faz um "refresh" na tela
      Seleciona(DbBlqentdados.Idblqentdados.AsInteger);
      SelecionaUsuxCRespon(DbBlqentdados.Idblqentdados.AsInteger);

   except
      on E:Exception do
      begin
         Rollback;
         CdsCRespon.EnableControls;
         CdsUsuarios.EnableControls;
         MessageInfo := E.Message;
         Result := false;
      end;
   end;
end;




function TCtrlBlqEntDados.ExcluirRegistros: boolean;
begin
   try
      StartTransaction;

      // Exclui todos os registros da tabela filho
      CdsDet.First;
      while not CdsDet.Eof do
         CdsDet.Delete;

      // Aplica as exclusões na tabela filho
      Result := ApplyCds(CdsDet,DbDetBlqentdados,[],[]);
      if not Result then
         raise Exception.Create(DbDetBlqentdados.MessageInfo);

      // Aplica as exclusões na tabela pai
      Result := ApplyCds(Cds,DbBlqentdados,[],[]);
      if not Result then
         raise Exception.Create(DbBlqentdados.MessageInfo);


      Commit;

      // Refresh na tela
      Seleciona(0);

   except
      on E:Exception do
      begin
         Rollback;
         MessageInfo := E.Message;
         Result := false;
      end;
   end;
end;




function TCtrlBlqEntDados.TestaEntDadosBlq(iIdUsuario,
  iIdEmpresa, iPeriodo, iExercicio: integer; iIdCenario: integer = -1): boolean;
var
  CdsCen,CdsCR: TCMClientDataSet;
  sSQL: string;

begin
   try
      CdsCR  := TCMClientDataSet.Create(nil);
      CdsCen := TCMClientDataSet.Create(nil);

      // Verifica se o período está bloqueado
      sSQL := 'SELECT IDBLQENTDADOS, PERIODO, EXERCICIO ' +
              'FROM BLQENTDADOS ' +
              'WHERE EXERCICIO   = ' + IntToStr(iExercicio);
              if iPeriodo <> 0 then
                 sSQL := sSQL + '  AND PERIODO = ' + IntToStr(iPeriodo);
      _Cds.Data := GetDataPacket(sSQL);
      Result := _Cds.IsEmpty;

      if ((not Result) and (iPeriodo = 0)) then
      begin
         MessageInfo := 'Há ao menos um período neste exercício (' + IntToStr(iExercicio) + ') ' +
                        'bloqueado para entrdada de dados. Não será possível prosseguir'; 
         Exit;
      end;


      // Se existir um registro para bloqueio do período/exercício...
      if not Result then
      begin
         // 1 - Faz a validação do cenário
         //-------------------------------------------------------------------------------
         if iIdCenario <> -1 then
         begin
            CdsCen.Data := GetDataPacket('SELECT IDBLQENTDADOS ' +
                                         'FROM DETBLQENTDADOS ' +
                                         'WHERE IDBLQENTDADOS    = ' + _Cds.FieldByName('IDBLQENTDADOS').AsString +
                                         '  AND IDCENARIOORCAMEN = ' + IntToStr(iIdCenario));
            Result := CdsCen.IsEmpty;
            if not Result then
            begin
               MessageInfo := 'Cenário bloqueado para entrada de dados no período ' + IntToStr(iPeriodo) + '/' + IntToStr(iExercicio);
               Exit;
            end;
         end;



         
         // 2 - Faz a validação de CR
         //-------------------------------------------------------------------------------
         CdsCR.Data := GetDataPacket('SELECT IDPESSOAACESSO ' +
                                     'FROM PESSOAXCRESP ' +
                                     'WHERE IDPESSOAACESSO = ' + IntToStr(iIdUsuario));
         if CdsCR.IsEmpty then
         begin
            MessageInfo := 'Este período (' + IntToStr(iPeriodo) + '/' + IntToStr(iExercicio) + ') está bloqueado, porém, o usuário ' +
                           'corrente não está vinculado a nenhum Centro de Responsabilidade. Não será possível prosseguir.';
            Exit;
         end;


         // Verifica se todo o C.Respon vinculado ao usuário está bloqueado
         CdsCR.Data := GetDataPacket('SELECT D.CODCENTRORESPON ' +
                                     'FROM DETBLQENTDADOS D ' +
                                     'WHERE EXISTS (SELECT PXC.CODCENTRORESPON ' +
                                     '              FROM PESSOAXCRESP PXC ' +
                                     '              WHERE TRIM(PXC.CODCENTRORESPON) = TRIM(D.CODCENTRORESPON) ' +
                                     '                AND PXC.IDPESSOAACESSO = ' + IntToStr(iIdUsuario) +
                                     '                AND D.IDBLQENTDADOS    = ' + _Cds.FieldByName('IDBLQENTDADOS').AsString +
                                     '                AND D.IDPESSOAACESSO IS NULL) ' +
                                     'GROUP BY D.CODCENTRORESPON ');
         Result := CdsCR.IsEmpty;
         if not Result then
            MessageInfo := 'Um dos Centros de Responsabilidade no qual o usuário corrente está vinculado ' +
                           'encontra-se bloqueado para a entrada de dados no período ' + IntToStr(iPeriodo) + '/' + IntToStr(iExercicio)
         else
         begin
            // Se todo o C.Respon não estiver bloqueado, verifica se o usuário corrente
            //está bloquado
            CdsCR.Data := GetDataPacket('SELECT D.CODCENTRORESPON ' +
                                        'FROM DETBLQENTDADOS D ' +
                                        'WHERE EXISTS (SELECT PXC.CODCENTRORESPON ' +
                                        '              FROM PESSOAXCRESP PXC ' +
                                        '              WHERE TRIM(PXC.CODCENTRORESPON) = TRIM(D.CODCENTRORESPON) ' +
                                        '                AND PXC.IDPESSOAACESSO = ' + IntToStr(iIdUsuario) +
                                        '                AND D.IDBLQENTDADOS    = ' + _Cds.FieldByName('IDBLQENTDADOS').AsString +
                                        '                AND D.IDPESSOAACESSO IS NOT NULL) ' +
                                        'GROUP BY D.CODCENTRORESPON ');
            Result := CdsCR.IsEmpty;
            if not Result then
               MessageInfo := 'O usuário corrente encontra-se bloqueado para entrada de dados no período ' + IntToStr(iPeriodo) + '/' + IntToStr(iExercicio);
         end;
      end;

   finally
      _Cds.Close;
      FreeAndNil(CdsCR);
      FreeAndNil(CdsCen);
   end;
end;

end.


