// Alterações:
{---------------------------------------------------------------------------------------------------
Pendência   : SOL 246767 PPM 734804
Responsável : Marcio Sanches Spinosa SOL 246767 PPM 734804
Data        : 02/04/2015
Descrição   : Ajuste no select que retorna dados para a grid.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 223325 Kintana 2057760
Responsável : Marcio Sanches Spinosa SOL 223325 Kintana 2057760
Data        : 21/01/2014
Descrição   : Ajuste no select que retorna dados para a grid.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 192648 Kintana 1835704
Responsável : Higor Nayde Ferreira
Data        : 29/10/2012
DFM         :
Descrição   : Correção de para que na funcionalidade ListaGeraIsencao para que posso carregar dados
			  caso uma pessoa contenha duas molestia grave em um unico ano.
---------------------------------------------------------------------------------------------------}
unit uCtrlGeraIsencao;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     classes, Forms, uCMMath,
     dbtables, mconnect, ucmFileUtils,
     uCmCustomCdbObject, ADODb, provider, {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
     uCripto, wwQuery, DBaseDados;

  Type
    TCtrlGeraIsencao = Class(TCmControlObject)
    private
      function AtualizaLinhasDirf(const pIdPessoa: Integer;
                                  const pvDados: Variant): Boolean;
      function SelecionaLinhasDirf(const pIdPessoa : Integer;
                                   const pMesInicial,
                                         pMesFinal : string;
                                   var   pvDados   : Variant) : Boolean;

      function LocalizaInformeDePara(pIdInforme: Integer): Integer;
      function ExisteIdInformeLancIRRF(const iIdLancamento,
                                             iIdInforme: Integer): Boolean;
    public
      function ListaGeraIsencao(const sAnoBusca : string) : OleVariant;
      function IsencaoRetroativa(const sAnoBusca       : string;
                                 const vDataBuscaDados : OleVariant): Boolean;

    End;


implementation

{ TCtrlGeraIsencao }


function OraNumero(rNumero: Double): string;
var sNumero : string;
    AuxDec  : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero          := FloatToStr(rNumero);
   Result           := sNumero;
   DecimalSeparator := AuxDec;
end;


function TCtrlGeraIsencao.AtualizaLinhasDirf(const pIdPessoa : Integer;
                                             const pvDados   : Variant) : Boolean;
var oAtualiza  : TClientDataSet;
    iResultado : Integer;
    sSql       : String;
    bExclui    : Boolean;
begin
  Result := True;
  Try
    oAtualiza := TClientDataSet.Create(Nil);
    oAtualiza.Data := pvDados;
    While Not oAtualiza.Eof do
    begin
      iResultado := LocalizaInformeDePara(oAtualiza.FieldByName('IdInforme').asInteger);
      If iResultado <> -1 then
      begin
        bExclui := ExisteIdInformeLancIRRF(oAtualiza.FieldByname('IdLancIRRF').AsInteger,iResultado);
        If Not bExclui then
          sSql := 'Update LancxInforme'+#13#10+
                  'Set IdInforme = '+IntToStr(iResultado) +#13#10+
                  'Where IdLancIRRF = '+oAtualiza.FieldByname('IdLancIRRF').asString+#13#10+
                  '  and IdInforme  = '+oAtualiza.FieldByName('IdInforme').asString
        else
          sSql := 'Update LancxInforme'+#13#10+
                  'Set Vlrlanc = VlrLanc + '+OraNumero(oAtualiza.FieldByName('VlrLanc').asFloat) +#13#10+
                  'Where IdLancIRRF = '+oAtualiza.FieldByname('IdLancIRRF').asString+#13#10+
                  '  and IdInforme  = '+IntToStr(iResultado);
        try
          ExecSQL(sSql);
          If bExclui then
          begin
            sSql := 'Delete LancxInforme'+#13#10+
                    'Where IdLancIRRF = '+oAtualiza.FieldByname('IdLancIRRF').asString+#13#10+
                    '  and IdInforme  = '+oAtualiza.FieldByName('IdInforme').asString;
            ExecSQL(sSql);
          end;
          Result := True;
        except
          Result := False;
          Raise;
        end;
      end;
      oAtualiza.Next;
    end;
    oAtualiza.Close;
  Finally
    FreeAndNil(oAtualiza);
  End;
end;

function TCtrlGeraIsencao.SelecionaLinhasDirf(const pIdPessoa : Integer;
                                              const pMesInicial,
                                                    pMesFinal : string ;
                                              var   pvDados   : Variant) : Boolean;
var oSeleciona : TClientDataSet;
    sSql : tStringList;
begin
  Try
    oSeleciona := TClientDataSet.Create(Nil);
    sSql := tStringList.Create;
    sSql.Text := 'select li.*' + #13#10 +
                 'from lancxinforme li,' + #13#10 +
                 '     lancirrf l,' + #13#10 +
                 '     informedepara i,' + #13#10 +
                 '     pessoaFisica pf' + #13#10 +
                 'where li.idlancirrf = l.idlancirrf' + #13#10 +
                 '  and li.idinforme  = i.idinformeOrigem' + #13#10 +
                 '  and l.idBenefIrrf = pf.IdPessoa' + #13#10 +
                 '  and l.idBenefIrrf = ' + IntToStr(pIdPessoa)+ #13#10 +
                 '  and pf.flgmolestiagrave = 1' + #13#10 +
                 '  and i.idSituacao = 2' + #13#10 +
                 '  and to_char(l.datapagamento,''yyyymm'') >= '+QuotedStr(pMesInicial) + #13#10 +
                 '  and to_char(l.datapagamento,''yyyymm'') <= '+QuotedStr(pMesFinal)+#13#10;
    oSeleciona.Data := GetDataPacket(sSql.Text);
    Result := Not oSeleciona.IsEmpty;
    pvDados := oSeleciona.Data;
    oSeleciona.Close;
  Finally
    FreeAndNil(oSeleciona);
  End;
end;

function TCtrlGeraIsencao.LocalizaInformeDePara(pIdInforme : Integer) : Integer;
var oPesquisa : TClientDataSet;
begin
  Result := -1;
  Try
    oPesquisa := TClientDataSet.Create(Nil);
    oPesquisa.Data := GetDataPacket('SELECT IDINFORMEDESTINO'+#13#10+
                                    'FROM INFORMEDEPARA'+#13#10+
                                    'WHERE IDINFORMEORIGEM = '+IntToStr(pIdInforme)+#13#10+
                                    '  AND IdSituacao = 2');
    If Not oPesquisa.IsEmpty then
      Result := oPesquisa.FieldByName('IDInformeDestino').asInteger;
  Finally
    FreeAndNil(oPesquisa);
  end;
end;

function TCtrlGeraIsencao.ExisteIdInformeLancIRRF(const iIdLancamento,iIdInforme : Integer) : Boolean;
var oPesquisa : TClientDataSet;
begin
  Try
    oPesquisa := TClientDataSet.Create(Nil);
    oPesquisa.Data := GetDataPacket('SELECT *'+#13#10+
                                    'FROM LANCXINFORME'+#13#10+
                                    'WHERE IDLANCIRRF = '+IntToStr(iIdLancamento)+#13#10+
                                    '  AND IDINFORME = '+IntToStr(iIdInforme));
    Result := Not oPesquisa.IsEmpty;
  Finally
    FreeAndNil(oPesquisa);
  end;
end;


function TCtrlGeraIsencao.IsencaoRetroativa(const sAnoBusca       : string;
                                            const vDataBuscaDados : OleVariant) : Boolean;

var oCds : TClientDataSet;
    vDados : Variant;
    IdPessoa : Integer;
begin
  Result := False;
  Try
    oCds := TClientDataSet.Create(Nil);
    oCds.data := vDataBuscaDados;
    StartTransaction;
    try
      while Not oCds.Eof do
      begin
        If oCds.FieldByName('FLGBUSCA').asString = 'S' then
        begin
          IdPessoa := oCds.FieldByName('IDPessoa').AsInteger;
          If SelecionaLinhasDirf(IdPessoa,
                                 oCds.FieldByName('MesInicioAcerto').asString,
                                 oCds.FieldByName('MesFinalAcerto').asString,
                                 vDados) then
            Result := AtualizaLinhasDirf(IdPessoa,vDados);
        end;
        oCds.next;
      end;
      oCds.Close;
      Commit;
      MessageInfo := 'Dados gravados com sucesso!';
    except
      MessageInfo := 'Não foi possivel gravar os dados!';
      RollBack;
    end;
  Finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlGeraIsencao.ListaGeraIsencao(const sAnoBusca : string): OleVariant;
var sSql : tStringList;
begin
  sSql := TStringList.Create();
  sSql.Text := 'Select *'+#13#10+
               'from ( Select L.IDPessoa,'+#13#10+
               '              L.Nome,'+#13#10+
               '              L.NumDocumento,'+#13#10+
//Marcio Sanches Spinosa SOL 223325 Kintana 2057760 - Inicio
//               '              Case When MesMolestiaGrave > MesPrimeiraFolha then MesMolestiaGrave'+#13#10+
//               '              Else MesPrimeiraFolha End as MesInicioAcerto,'+#13#10+
//               '              To_Char(To_Number(L.PrimeiroDesconto)-1) as MesFinalAcerto,'+#13#10+
               '              Case When PrimeiroDesconto > MesPrimeiraFolha then PrimeiroDesconto'+#13#10+
               '              Else MesPrimeiraFolha End as MesInicioAcerto,'+#13#10+
               '              To_Char(To_Number(L.UltimoDesconto)) as MesFinalAcerto,'+#13#10+
//Marcio Sanches Spinosa SOL 223325 Kintana 2057760 - Fim
               '              ''N'' as FLGBusca'+#13#10+
               '       from ( /*Select Distinct M.IDPessoa,'+#13#10+
               '                     P.Nome,'+#13#10+
               '                     p.NumDocumento,'+#13#10+
               '                     M.MesMolestiaGrave,'+#13#10+
               '                     M.PrimeiroDesconto,'+#13#10+
               '                     M.UltimoDesconto,'+#13#10+//Marcio Sanches Spinosa SOL 223325 Kintana 2057760
               '                     ( Select distinct Min(To_char(h.datapagamento,''yyyymm''))'+#13#10+
               '                       from histrubsal h'+#13#10+
               '                       where h.datapagamento >= to_date('+QuotedStr('01/01/'+sAnoBusca)+',''dd/mm/yyyy'')'+#13#10+
               '                         and h.datapagamento <= to_date('+QuotedStr('31/12/'+sAnoBusca)+',''dd/mm/yyyy'')'+#13#10+
               '                         and idresponsavel = m.idpessoa) as MesPrimeiraFolha'+#13#10+
               '              From ( Select l.idbenefirrf as idpessoa,'+#13#10+
               '                            pf.flgmolestiagrave,'+#13#10+
               '                            To_Char(pf.Datamolestiagrave, ''yyyymm'') as MesMolestiaGrave,'+#13#10+
			   // Marcio Sanches Spinosa SOL 246767 PPM 734804 - Inicio
               '                            To_Char(pf.Datamolestiagrave, ''yyyymm'') as PrimeiroDesconto,'+#13#10+
//               '                            To_Char(Min(l.DataLancamento),''yyyymm'') as PrimeiroDesconto,'+#13#10+
			   // Marcio Sanches Spinosa SOL 246767 PPM 734804 - Fim
               '                            To_Char(Max(l.DataLancamento),''yyyymm'') as UltimoDesconto'+#13#10+
               '                     from lancxinforme LI, LancIRRF L, pessoafisica pf'+#13#10+
               '                     where l.idlancirrf = li.idlancirrf'+#13#10+
               '                       and l.idbenefirrf = pf.idpessoa'+#13#10+
               '                       and pf.flgmolestiagrave = 1'+#13#10+
               '                       and li.idInforme in (54,55)'+#13#10+
               '                       and to_char(l.datalancamento,''yyyymm'') >=  to_char(pf.Datamolestiagrave,''yyyymm'')'+#13#10+  //Higor Nayde Ferreira SOL 192648 Kintana 1835704
               '                       and l.datalancamento >= to_date('+QuotedStr('01/01/'+sAnoBusca)+',''dd/mm/yyyy'')'+#13#10+
               '                       and l.datalancamento <= to_date('+QuotedStr('31/12/'+sAnoBusca)+',''dd/mm/yyyy'')'+#13#10+
               '                       and not To_Char(pf.Datamolestiagrave, ''yyyymm'') is null'+#13#10+
               '                       and To_Char(pf.Datamolestiagrave, ''yyyymm'') >= '+QuotedStr(sAnoBusca+'01')+#13#10+
               '                     group by l.IdBenefIRRF,'+#13#10+
               '                              pf.flgmolestiagrave,'+#13#10+
               '                              To_Char(pf.Datamolestiagrave,''yyyymm'')'+#13#10+
               '                     having To_Char(Min(l.DataLancamento),''yyyymm'') > To_Char(pf.Datamolestiagrave, ''yyyymm'')'+#13#10+
               '                   ) M,'+#13#10+
               '                   Pessoa P'+#13#10+
               '              where M.IDPessoa  = P.IDPessoa'+#13#10+
               '              Union */'+#13#10+
               '              Select Distinct M.IDPessoa,'+#13#10+
               '                     P.Nome,'+#13#10+
               '                     p.NumDocumento,'+#13#10+
               '                     M.MesMolestiaGrave,'+#13#10+
               '                     M.PrimeiroDesconto,'+#13#10+
               '                     M.UltimoDesconto,'+#13#10+ //Marcio Sanches Spinosa SOL 223325 Kintana 2057760
               '                     ( Select distinct Min(To_char(h.datapagamento,''yyyymm''))'+#13#10+
               '                       from histrubsal h'+#13#10+
               '                       where  h.idpessoa /*idresponsavel */ = m.idpessoa '+#13#10+
               '                         and h.datapagamento >= to_date('+QuotedStr('01/01/'+sAnoBusca)+',''dd/mm/yyyy'')'+#13#10+
               '                         and h.datapagamento <= to_date('+QuotedStr('31/12/'+sAnoBusca)+',''dd/mm/yyyy'')'+#13#10+
               '                         /*and h.idpessoa idresponsavel = m.idpessoa */ ) as MesPrimeiraFolha'+#13#10+
               '              From ( Select l.idbenefirrf as idpessoa,'+#13#10+
               '                            pf.flgmolestiagrave,'+#13#10+
               '                            To_Char(pf.Datamolestiagrave, ''yyyymm'') as MesMolestiaGrave,'+#13#10+
			   // Marcio Sanches Spinosa SOL 246767 PPM 734804 - Incio	
               '                            To_Char(pf.Datamolestiagrave, ''yyyymm'') as PrimeiroDesconto,'+#13#10+
//               '                            To_Char(Min(l.DataLancamento),''yyyymm'') as PrimeiroDesconto,'+#13#10+
			   // Marcio Sanches Spinosa SOL 246767 PPM 734804 - Fim	
               '                            To_Char(Max(l.DataLancamento),''yyyymm'') as UltimoDesconto'+#13#10+
               '                     from lancxinforme LI, LancIRRF L, pessoafisica pf'+#13#10+
               '                     where l.idlancirrf = li.idlancirrf'+#13#10+
               '                       and l.idbenefirrf = pf.idpessoa'+#13#10+
               '                       and pf.flgmolestiagrave = 1'+#13#10+
               '                       and li.idInforme in (Select IdInformeOrigem from InformeDePara where IdInformeDestino in (54,55))'+#13#10+
               '                       and l.datalancamento >= to_date('+QuotedStr('01/01/'+sAnoBusca)+',''dd/mm/yyyy'')'+#13#10+
               '                       and l.datalancamento <= to_date('+QuotedStr('31/12/'+sAnoBusca)+',''dd/mm/yyyy'')'+#13#10+
               '                     /*  and not To_Char(pf.Datamolestiagrave, ''yyyymm'') is null */'+#13#10+
               '                       and To_Char(pf.Datamolestiagrave, ''yyyymm'') >= '+QuotedStr(sAnoBusca+'01')+#13#10+
               '                     group by l.IdBenefIRRF,'+#13#10+
               '                              pf.flgmolestiagrave,'+#13#10+
               '                              To_Char(pf.Datamolestiagrave,''yyyymm'')'+#13#10+
               '           /*          having To_Char(Min(l.DataLancamento),''yyyymm'') >= To_Char(pf.Datamolestiagrave, ''yyyymm'') */'+#13#10+
               '                   ) M,'+#13#10+
               '                   Pessoa P'+#13#10+
               '              where M.IDPessoa  = P.IDPessoa'+#13#10+
               '            ) L'+#13#10+
               '       where ( (l.MesMolestiaGrave >= l.MesPrimeiraFolha and l.MesMolestiaGrave <= l.PrimeiroDesconto)   or'+#13#10+
               '               (l.MesMolestiaGrave <  l.MesPrimeiraFolha and l.MesPrimeiraFolha < l.PrimeiroDesconto)  )'+#13#10+
               '     ) m'+#13#10+
               'where not exists ( Select 1'+#13#10+
               '                   from lancirrf lir,'+#13#10+
               '                        lancxinforme lirx,'+#13#10+
               '                        InformeDePara IDP'+#13#10+
               '                   where lir.idlancirrf = lirx.idlancirrf'+#13#10+
               '                     and IDP.Idinformedestino = lirx.IdInforme'+#13#10+
               '                     and IDP.idSituacao = 2'+#13#10+
               '                     and lir.idbenefirrf = m.idpessoa'+#13#10+
               '                     and to_char(lir.datalancamento,''yyyymm'') >= m.MesInicioAcerto'+#13#10+
               '                     and to_char(lir.datalancamento,''yyyymm'') <= m.MesFinalAcerto)'+#13#10+
//               '                     and numdocumento = ''04784383549'' ' +
               'Order By Nome'+#13#10;
  sSql.SaveToFile('C:\Planus\temp\SqlIsencao.sql');
  Result := GetDataPacket(sSql.Text);
  sSql.Clear;
  FreeAndNil(sSql);
end;


end.
