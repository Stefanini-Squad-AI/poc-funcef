unit FBuscaIRCARCAR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97,
  wwdblook, Db, DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmBuscaIRCARCAR = class(TfrmSairAjuda)
    qryNatRendimento: TwwQuery;
    dblcNatRendimento: TwwDBLookupCombo;
    lblNatRendimento: TLabel;
    gbFaixaDatas: TGroupBox;
    dedDataIni: TCMDateTimePicker;
    dedDataFim: TCMDateTimePicker;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    bbtnConfirmaGeracao: TBitBtn;
    qryParamIRRF: TwwQuery;
    qryDocumento: TwwQuery;
    qryEmpresaProp: TwwQuery;
    qryAux: TwwQuery;
    prgBarAtuFluxo: TProgressBar;
    ToolbarSep971: TToolbarSep97;
    qryLancamento: TwwQuery;
    qryFatura: TwwQuery;
    qryInforme: TwwQuery;
    qryVazia: TwwQuery;
    qryAltxImp: TwwQuery;
    qryAltxImpCODALTERADOR: TFloatField;
    qryAlterador: TwwQuery;
    qryAlteradorPLACONTA: TStringField;
    qryAlteradorPLANO: TFloatField;
    qryTipoDesemb: TwwQuery;
    qryRateioPlanoPatro: TwwQuery;
    qryRateioPlanoPatroIDPATRO: TFloatField;
    qryRateioPlanoPatroIDPLANOPREV: TFloatField;
    qryRateioPlanoPatroIDPROGRAMA: TFloatField;
    qryRateioPlanoPatroPERC: TFloatField;
    qryRateioPlanoPatroCODCENTROCUSTO: TStringField;
    qryAlteradorCODNATUREZA: TStringField;
    procedure FormPaint(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function Arredonda(rValor:Real;iNumDecimais: Integer):Real;
  public
    { Public declarations }
  end;

var
  frmBuscaIRCARCAR: TfrmBuscaIRCARCAR;

implementation

{$R *.DFM}

Uses USistema, UMensErro, UDatabase, DBaseDados,UFuncaoGeral,UModulo,ULancIRRF,UIntegraBack;

procedure TfrmBuscaIRCARCAR.FormPaint(Sender: TObject);
begin
  inherited;
  If Modulo.sRECPAG ='R' then
     frmBuscaIRCARCAR.Caption:='Busca IRRF do Contas a Receber';
  If Modulo.sRECPAG ='P' then
     frmBuscaIRCARCAR.Caption:='Busca IRRF do Contas a Pagar';
end;

procedure TfrmBuscaIRCARCAR.FormActivate(Sender: TObject);
var dDataVenc : TDateTime;
begin
  inherited;
  //
  qryNatRendimento.Close;
  qryNatRendimento.SQL.Clear;
  qryNatRendimento.SQL.text := 'SELECT * FROM NATURENDIMENTO ORDER BY CODNATUREZA';
  qryNatRendimento.Open;
  //
  qryParamIRRF.Close;
  qryParamIRRF.SQL.Clear;
  qryParamIRRF.SQL.text := 'SELECT * FROM PARAMIRRF WHERE IDPESSOA = '+ IntToStr(Sistema.idEmpresa);
  qryParamIRRF.Open;
  //
  qryEmpresaProp.Close;
  qryEmpresaProp.SQL.Clear;
  qryEmpresaProp.SQL.text := 'SELECT NOME,NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = '+ IntToStr(Sistema.idEmpresa);
  qryEmpresaProp.Open;
  //
  dDataVenc  := Modulo.CalcProxDiaSemana(Date,3,True);
  //
  dedDataIni.Date   := Modulo.CalcDataIni(dDataVenc);
  dedDataFim.Date   := Modulo.CalcDataFim(dDataVenc);
  dedDataIni.Text   := DateToStr(dedDataIni.Date);
  dedDataFim.Text   := DateToStr(dedDataFim.Date);
  //
  qryNatRendimento.Last;
  dblcNatRendimento.LookupValue := qryNatRendimento.FieldByName('CODNATUREZA').AsString;
  //
  dedDataIni.SetFocus;
end;

procedure TfrmBuscaIRCARCAR.bbtnConfirmaGeracaoClick(Sender: TObject);
var iIdModulo, iPlano,iBenef,iCodAltIRRF,iCodAltCom,iCodAltINSS,iCodDocumento:LongInt;
    rValBase,rValIRRF,rValINSS, iCodLanc:Double;
    sContaContabil, sCodNatureza, sDataLanc:String;
    bPrim, bInsereImposto, bOperacao2:Boolean;
    rValRatIRRF, rValRatBase, rValRatINSS, rTotIRRF, rTotBase, rTotINSS : Double;
begin
  inherited;
  qryInforme.Close;
  qryInforme.Open;
  if (qryInforme.IsEmpty) or (qryInforme.RecordCount < 2) then begin
     MsgDlg('Favor preencher o Cadastro "Linhas para o Informe de Rendimento"','Erro',mtError,[mbOK],0);
     FuncaoGeral.TiraIcone;
     bbtnSairClick(Self);
     exit;
  end;
  //
  qryDocumento.Close;
  qryDocumento.SQL.Clear;
  if qryParamIRRF.FieldByName('FLGPAGLANC').AsString = 'L' then begin
     qryDocumento.SQL.text := 'SELECT D.NUMFATURA,D.IDFORCLI,L.CODALTERADOR,L.CODDOCUMENTO,L.DATALANCTO ,L.VALOR,L.OPERACAO FROM DOCUMENTO D, LANCTODOCUM L '+
                              'WHERE D.IDPESSOA = '+IntToStr(Sistema.Idempresa)+' AND D.RECPAG = '''+Modulo.sRecPag+''' AND (L.DATALANCTO BETWEEN to_date('''+dedDataIni.Text+''',''dd/mm/yyyy'') AND '+
                              'to_date('''+dedDataFim.Text+''',''dd/mm/yyyy'')) AND '+
                              '(L.OPERACAO IN (''2 '',''3 '')) AND (D.CODDOCUMENTO = L.CODDOCUMENTO) ORDER BY L.CODDOCUMENTO, L.DATALANCTO DESC';
  end else begin
     qryDocumento.SQL.text := 'SELECT D.NUMFATURA,D.IDFORCLI,L.CODDOCUMENTO,MAX(L.DATALANCTO) AS DATALANCTO  FROM DOCUMENTO D,LANCTODOCUM L '+
                              'WHERE D.IDPESSOA = '+IntToStr(Sistema.Idempresa)+' AND D.RECPAG = '''+Modulo.sRecPag+''' AND (L.DATALANCTO BETWEEN to_date('''+dedDataIni.Text+''',''dd/mm/yyyy'') AND '+
                              'to_date('''+dedDataFim.Text+''',''dd/mm/yyyy'')) AND '+
                              '(L.OPERACAO = ''5 '') AND (D.STATUS = ''2'') AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+
                              'GROUP BY D.NUMFATURA,D.IDFORCLI,L.CODDOCUMENTO '+
                              'ORDER BY L.CODDOCUMENTO, DATALANCTO DESC';
  end;
  qryDocumento.Open;
  //
  iIdModulo := Sistema.IdModulo;
  //
  if Modulo.sRecPag = 'R' then
  Begin
     if (qryParamIRRF.FieldByName('CODALTIRRFCAR').AsInteger = 0) or (qryParamIRRF.FieldByName('CODALTCOMISSAO').AsInteger = 0)then
     Begin
        MsgDlg('Parâmetros para Gerar os dados a partir do Contas a Receber não Preenchidos','Erro',mtError,[mbOK],0);
        FuncaoGeral.TiraIcone;
        bbtnSairClick(Self);
        exit;
     end;
     iIdModulo := 4;
  end;
  if Modulo.sRecPag = 'P' then
  Begin
     if (qryParamIRRF.FieldByName('CODALTIRRFCAP').AsInteger = 0) or (qryParamIRRF.FieldByName('CODALTINSS').AsInteger = 0)then
     Begin
        MsgDlg('Parâmetros para Gerar os dados a partir do Contas a Pagar não Preenchidos','Erro',mtError,[mbOK],0);
        FuncaoGeral.TiraIcone;
        bbtnSairClick(Self);
        exit;
     end;
     iIdModulo := 3;
  end;
  if dedDataIni.Text = '' then
  Begin
     MsgDlg('Obrigatório Preencher a Data Inicial','Erro',mtError,[mbOK],0);
     FuncaoGeral.TiraIcone;
     dedDataIni.SetFocus;
     exit;
  end;
  if dedDataFim.Text = '' then
  Begin
     MsgDlg('Obrigatório Preencher a Data Final','Erro',mtError,[mbOK],0);
     FuncaoGeral.TiraIcone;
     dedDataFim.SetFocus;
     exit;
  end;
  if dedDataFim.Date < dedDataIni.Date then
  Begin
     MsgDlg('Data Final não pode ser menor do que Data Inicial','Erro',mtError,[mbOK],0);
     FuncaoGeral.TiraIcone;
     dedDataFim.SetFocus;
     exit;
  end;
  if dblcNatRendimento.Text = '' then
  Begin
     MsgDlg('Obrigatório Preencher a Natureza de Rendimento Global','Erro',mtError,[mbOK],0);
     FuncaoGeral.TiraIcone;
     dblcNatRendimento.SetFocus;
     exit;
  end;
  //
  If Modulo.sRECPAG ='R' then begin
     iCodAltIRRF:=qryParamIRRF.FieldByName('CODALTIRRFCAR').AsInteger;
     iCodAltCom :=qryParamIRRF.FieldByName('CODALTCOMISSAO').AsInteger;
     iCodAltINSS:=0;
  end else begin
     iCodAltIRRF:=qryParamIRRF.FieldByName('CODALTIRRFCAP').AsInteger;
     iCodAltCom :=0;
     iCodAltINSS:=qryParamIRRF.FieldByName('CODALTINSS').AsInteger;
  end;
  bbtnConfirmaGeracao.Enabled :=False;
  prgBarAtuFluxo.Visible      :=True;
  prgBarAtuFluxo.Position     := 0;
  prgBarAtuFluxo.Max          := qryDocumento.RecordCount;
  //
  qryDocumento.First;
  While not qryDocumento.EOF do begin
     prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
     iCodDocumento:=qryDocumento.FieldByName('CODDOCUMENTO').AsInteger;
     iBenef       :=qryDocumento.FieldByName('IDFORCLI').AsInteger;
     //
     qryAux.Close;
     qryAux.SQL.Clear;
     if Modulo.sRecPag = 'R' then
        qryAux.SQL.text := 'SELECT FC.CODNATUREZA,P.TIPO FROM CLIENTEPESS FC, PESSOA P WHERE FC.IDPESSOA = '+ IntToStr(iBenef)+' AND P.IDPESSOA = FC.IDPESSOA';
     if Modulo.sRecPag = 'P' then
        qryAux.SQL.text := 'SELECT FC.CODNATUREZA,P.TIPO FROM FORNSERV FC, PESSOA P WHERE FC.IDPESSOA = '+ IntToStr(iBenef)+' AND P.IDPESSOA = FC.IDPESSOA';
     qryAux.Open;
     //
     sCodNatureza:=trim(qryAux.FieldByName('CODNATUREZA').AsString);
     sDataLanc   :=qryDocumento.FieldByName('DATALANCTO').AsString;
     rValBase       := 0;
     rValIRRF       := 0;
     rValINSS       := 0;
     sContaContabil := '';
     iPlano         := 0;
     qryLancamento.Close;
     qryLancamento.ParamByName('CODDOCUMENTO').AsFloat := qryDocumento.FieldByname('CODDOCUMENTO').AsFloat;
     qryLancamento.Open;
     //
     qryRateioPlanoPatro.Close;
     qryRateioPlanoPatro.ParamByName('CODDOCUMENTO').AsFloat := qryDocumento.FieldByname('CODDOCUMENTO').AsFloat;
     qryRateioPlanoPatro.Open;
     //
     qryLancamento.First;
     bOperacao2     := False;
     bInsereImposto := False;
     While not qryLancamento.EOF do begin
        if (trim(qryLancamento.FieldByName('OPERACAO').AsString) = '2') then begin
           bOperacao2 := True;
           qryTipoDesemb.Close;
           qryTipoDesemb.ParamByName('CODDOCUMENTO').AsFloat := qryDocumento.FieldByname('CODDOCUMENTO').AsFloat;
           qryTipoDesemb.Open;
           if not qryTipoDesemb.IsEmpty then bInsereImposto := True;
        end;
        if (qryLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltIRRF) then begin
           rValIRRF :=rValIRRF+(qryLancamento.FieldByName('VALOR').AsFloat);
           qryAlterador.Close;
           If Not qryAlterador.Prepared Then qryAlterador.Prepare;
           qryAlterador.ParamByName('CODALTERADOR').AsInteger := qryLancamento.FieldByName('CODALTERADOR').AsInteger;
           qryAlterador.Open;
           if sCodNatureza = '' then
              sCodNatureza:=trim(qryAlteradorCODNATUREZA.AsString);
           sContaContabil := qryAlteradorPLACONTA.AsString;
           iPlano         := qryAlteradorPLANO.AsInteger;
           if iPlano = 0 then iPlano := IntegraBack.Plano;
        end else begin
           qryAltxImp.Close;
           If Not qryAltxImp.Prepared Then qryAltxImp.Prepare;
           qryAltxImp.ParamByName('CODIMPOSTO').AsInteger   := 1;
           qryAltxImp.ParamByName('CODALTERADOR').AsInteger := qryLancamento.FieldByName('CODALTERADOR').AsInteger;
           qryAltxImp.Open;
           If Not qryAltxImp.IsEmpty then begin
              rValIRRF :=rValIRRF+(qryLancamento.FieldByName('VALOR').AsFloat);
              qryAlterador.Close;
              If Not qryAlterador.Prepared Then qryAlterador.Prepare;
              qryAlterador.ParamByName('CODALTERADOR').AsInteger := qryLancamento.FieldByName('CODALTERADOR').AsInteger;
              qryAlterador.Open;
              if sCodNatureza = '' then
                 sCodNatureza:=trim(qryAlteradorCODNATUREZA.AsString);
              sContaContabil := qryAlteradorPLACONTA.AsString;
              iPlano         := qryAlteradorPLANO.AsInteger;
              if iPlano = 0 then iPlano := IntegraBack.Plano;
           end;
        end;
        if Modulo.sRecPag = 'R' then begin
           if (qryLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltCom) then
              rValBase:=rValBase+(qryLancamento.FieldByName('VALOR').AsFloat);
        end;
        if Modulo.sRecPag = 'P' then begin
           if (qryLancamento.FieldByName('OPERACAO').AsInteger <= 3) Then
              rValBase:=rValBase+(qryLancamento.FieldByName('VALOR').AsFloat);
           if (qryLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltINSS) then begin
              rValINSS:=rValINSS+(qryLancamento.FieldByName('VALOR').AsFloat);
           end else begin
              qryAltxImp.Close;
              If Not qryAltxImp.Prepared Then qryAltxImp.Prepare;
              qryAltxImp.ParamByName('CODIMPOSTO').AsInteger   := 2;
              qryAltxImp.ParamByName('CODALTERADOR').AsInteger := qryLancamento.FieldByName('CODALTERADOR').AsInteger;
              qryAltxImp.Open;
              If Not qryAltxImp.IsEmpty then
                 rValINSS:=rValINSS+(qryLancamento.FieldByName('VALOR').AsFloat);
           end;
        end;
        qryLancamento.Next;
     end;
     if rValIRRF <> 0 then
        bInsereImposto := True;
     //
     if ((bOperacao2) or (rValIRRF <> 0)) and (rValBase <> 0) and
        (((qryAux.FieldByName('TIPO').AsString = 'J') and (rValIRRF <> 0)) or
        ((qryAux.FieldByName('TIPO').AsString = 'F') and bInsereImposto)) then
     Begin
        if sCodNatureza = '' then
           sCodNatureza:=trim(qryNatRendimento.FieldByName('CODNATUREZA').AsString);
        Try
           StartTransacao;
           if Sistema.UsaPlanoPatro then begin
              bPrim := True;
              rTotIRRF := 0;
              rTotBase := 0;
              rTotINSS := 0;
              qryRateioPlanoPatro.First;
              While not qryRateioPlanoPatro.EOF do begin
                 iCodLanc    := 0;
                 rValRatIRRF := Arredonda(rValIRRF*qryRateioPlanoPatroPERC.AsFloat,2);
                 rValRatBase := Arredonda(rValBase*qryRateioPlanoPatroPERC.AsFloat,2);
                 rValRatINSS := Arredonda(rValINSS*qryRateioPlanoPatroPERC.AsFloat,2);
                 rTotIRRF    := rTotIRRF + rValRatIRRF;
                 rTotBase    := rTotBase + rValRatBase;
                 rTotINSS    := rTotINSS + rValRatINSS;
                 LancIRRF.GravaIRRF(iCodDocumento,Sistema.idEmpresa,iBenef,sCodNatureza,
                             sDataLanc,rValRatBase,rValRatIRRF,
                             rValRatINSS,0,rValRatBase,
                             (rValIRRF/rValBase*100), qryVazia, iCodLanc, sContaContabil, iPlano,
                             'N',qryRateioPlanoPatroIDPLANOPREV.AsInteger,
                             qryRateioPlanoPatroIDPATRO.AsInteger, qryRateioPlanoPatroIDPROGRAMA.AsInteger,bPrim,iIdModulo,-1,
                             qryRateioPlanoPatroCODCENTROCUSTO.AsString,-1);
                 qryRateioPlanoPatro.Next;
              end;
              qryRateioPlanoPatro.First;
              qryRateioPlanoPatro.Last;
              if (Format('%17.2f',[rTotIRRF]) <> Format('%17.2f',[rValIRRF])) or
                 (Format('%17.2f',[rTotBase]) <> Format('%17.2f',[rValBase])) or
                 (Format('%17.2f',[rTotINSS]) <> Format('%17.2f',[rValINSS])) then begin
                 iCodLanc    := 0;
                 rValRatIRRF := rValIRRF - rTotIRRF;
                 rValRatBase := rValBase - rTotBase;
                 rValRatINSS := rValINSS - rTotINSS;
                 LancIRRF.GravaIRRF(iCodDocumento,Sistema.idEmpresa,iBenef,sCodNatureza,
                             sDataLanc,rValRatBase,rValRatIRRF,
                             rValRatINSS,0,rValRatBase,
                             (rValIRRF/rValBase*100), qryVazia, iCodLanc, sContaContabil, iPlano,
                             'N',qryRateioPlanoPatroIDPLANOPREV.AsInteger,
                             qryRateioPlanoPatroIDPATRO.AsInteger, qryRateioPlanoPatroIDPROGRAMA.AsInteger,bPrim,iIdModulo,-1,
                             qryRateioPlanoPatroCODCENTROCUSTO.AsString,-1);

              end;

           end else begin
              iCodLanc := 0;
              bPrim := True;
              LancIRRF.GravaIRRF(iCodDocumento,Sistema.idEmpresa,iBenef,sCodNatureza,
                          sDataLanc,rValBase,rValIRRF,rValINSS,0,rValBase,
                          (rValIRRF/rValBase*100), qryVazia, iCodLanc, sContaContabil, iPlano,
                          'N',0,0,0,bPrim,iIdModulo,-1,'',-1);
           end;
           CommitTransacao;
        Except
           RollBackTransacao;
           MsgDlg('Erro na Geração','Erro',mtError,[mbOK],0);
           Raise;
        end;
     end;
     if not bOperacao2 then begin
        qryFatura.Close;
        qryFatura.ParamByName('NUMFATURA').AsInteger := qryDocumento.FieldByName('NUMFATURA').AsInteger;
        qryFatura.Open;
        //
        qryFatura.First;
        While not qryFatura.EOF do begin
           qryTipoDesemb.Close;
           qryTipoDesemb.ParamByName('CODDOCUMENTO').AsFloat := qryFatura.FieldByname('CODDOCUMENTO').AsFloat;
           qryTipoDesemb.Open;
           if not qryTipoDesemb.IsEmpty then bInsereImposto := True;
           iCodDocumento:=qryFatura.FieldByName('CODDOCUMENTO').AsInteger;
           rValBase       := 0;
           rValIRRF       := 0;
           rValINSS       := 0;
           sContaContabil := '';
           iPlano         := 0;
           qryLancamento.Close;
           qryLancamento.ParamByName('CODDOCUMENTO').AsInteger := qryFatura.FieldByName('CODDOCUMENTO').AsInteger;
           qryLancamento.Open;
           //
           qryRateioPlanoPatro.Close;
           qryRateioPlanoPatro.ParamByName('CODDOCUMENTO').AsFloat := qryFatura.FieldByname('CODDOCUMENTO').AsFloat;
           qryRateioPlanoPatro.Open;
           //
           qryLancamento.First;
           While not qryLancamento.EOF do begin
              //
              if (qryLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltIRRF) then
              Begin
                 rValIRRF :=rValIRRF+(qryLancamento.FieldByName('VALOR').AsFloat);
                 qryAlterador.Close;
                 If Not qryAlterador.Prepared Then qryAlterador.Prepare;
                 qryAlterador.ParamByName('CODALTERADOR').AsInteger := qryLancamento.FieldByName('CODALTERADOR').AsInteger;
                 qryAlterador.Open;
                 if sCodNatureza = '' then
                    sCodNatureza:=trim(qryAlteradorCODNATUREZA.AsString);
                 sContaContabil := qryAlteradorPLACONTA.AsString;
                 iPlano         := qryAlteradorPLANO.AsInteger;
                 if iPlano = 0 then iPlano := IntegraBack.Plano;
              end;
              if Modulo.sRecPag = 'R' then
              Begin
                 if (qryLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltCom) then
                    rValBase:=rValBase+(qryLancamento.FieldByName('VALOR').AsFloat);
              end;
              if Modulo.sRecPag = 'P' then
              Begin
                 if (qryLancamento.FieldByName('OPERACAO').AsInteger <= 3) Then
                    rValBase:=rValBase+(qryLancamento.FieldByName('VALOR').AsFloat);
                 if (qryLancamento.FieldByName('CODALTERADOR').AsInteger = iCodAltINSS) then
                    rValINSS:=rValINSS+(qryLancamento.FieldByName('VALOR').AsFloat);
              end;
              qryLancamento.Next;
           end;
           if rValIRRF <> 0 then bInsereImposto := True;
           if (rValBase <> 0) and
              (((qryAux.FieldByName('TIPO').AsString = 'J') and (rValIRRF <> 0)) or
              ((qryAux.FieldByName('TIPO').AsString = 'F') and bInsereImposto)) then
           Begin
              if sCodNatureza = '' then
                 sCodNatureza:=trim(qryNatRendimento.FieldByName('CODNATUREZA').AsString);
              Try
                 StartTransacao;
                 if Sistema.UsaPlanoPatro then begin
                    bPrim := True;
                    rTotIRRF := 0;
                    rTotBase := 0;
                    rTotINSS := 0;
                    qryRateioPlanoPatro.First;
                    While not qryRateioPlanoPatro.EOF do begin
                       iCodLanc := 0;
                       rValRatIRRF := Arredonda(rValIRRF*qryRateioPlanoPatroPERC.AsFloat,2);
                       rValRatBase := Arredonda(rValBase*qryRateioPlanoPatroPERC.AsFloat,2);
                       rValRatINSS := Arredonda(rValINSS*qryRateioPlanoPatroPERC.AsFloat,2);
                       rTotIRRF    := rTotIRRF + rValRatIRRF;
                       rTotBase    := rTotBase + rValRatBase;
                       rTotINSS    := rTotINSS + rValRatINSS;
                       LancIRRF.GravaIRRF(iCodDocumento,Sistema.idEmpresa,iBenef,sCodNatureza,
                                   sDataLanc,rValRatBase, rValRatIRRF,rValRatINSS,0,
                                   rValRatBase,(rValIRRF/rValBase*100),qryVazia,iCodLanc,
                                   sContaContabil, iPlano, 'N',qryRateioPlanoPatroIDPLANOPREV.AsInteger,
                                   qryRateioPlanoPatroIDPATRO.AsInteger, qryRateioPlanoPatroIDPROGRAMA.AsInteger, bPrim,iIdModulo,-1,
                                   qryRateioPlanoPatroCODCENTROCUSTO.AsString,-1);
                       bPrim := False;
                       qryRateioPlanoPatro.Next;
                    end;
                    qryRateioPlanoPatro.First;
                    qryRateioPlanoPatro.Last;
                    if (Format('%17.2f',[rTotIRRF]) <> Format('%17.2f',[rValIRRF])) or
                       (Format('%17.2f',[rTotBase]) <> Format('%17.2f',[rValBase])) or
                       (Format('%17.2f',[rTotINSS]) <> Format('%17.2f',[rValINSS])) then begin
                       iCodLanc    := 0;
                       rValRatIRRF := rValIRRF - rTotIRRF;
                       rValRatBase := rValBase - rTotBase;
                       rValRatINSS := rValINSS - rTotINSS;
                       LancIRRF.GravaIRRF(iCodDocumento,Sistema.idEmpresa,iBenef,sCodNatureza,
                                   sDataLanc,rValRatBase,rValRatIRRF,
                                   rValRatINSS,0,rValRatBase,
                                   (rValIRRF/rValBase*100), qryVazia, iCodLanc, sContaContabil, iPlano,
                                   'N',qryRateioPlanoPatroIDPLANOPREV.AsInteger,
                                   qryRateioPlanoPatroIDPATRO.AsInteger, qryRateioPlanoPatroIDPROGRAMA.AsInteger,bPrim,iIdModulo,-1,
                                   qryRateioPlanoPatroCODCENTROCUSTO.AsString,-1);

                    end;
                 end else begin
                    iCodLanc := 0;
                    bPrim := True;
                    LancIRRF.GravaIRRF(iCodDocumento,Sistema.idEmpresa,iBenef,sCodNatureza,
                                sDataLanc,rValBase,rValIRRF,rValINSS,0,rValBase,(rValIRRF/rValBase*100),
                                qryVazia,iCodLanc,sContaContabil ,iPlano ,'N' , 0, 0, 0, bPrim, iIdModulo,-1,'',-1);
                 end;
                 CommitTransacao;
              Except
                 RollBackTransacao;
                 MsgDlg('Erro na Geração','Erro',mtError,[mbOK],0);
                 Raise;
              end;
           end;
           qryFatura.Next;
        end;
     end;
     //
     qryDocumento.Next;
  end;
  bbtnConfirmaGeracao.Enabled :=True;
  prgBarAtuFluxo.Visible      :=False;
  MsgDlg('Geração Terminada','Aviso',mtWarning,[mbOK],0);
end;

procedure TfrmBuscaIRCARCAR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryAltxImp.Close;
  If qryAltxImp.Prepared Then qryAltxImp.UnPrepare;
  qryAlterador.Close;
  If qryAlterador.Prepared Then qryAlterador.UnPrepare;
end;


function TfrmBuscaIRCARCAR.Arredonda(rValor:Real;iNumDecimais: Integer):Real;
Var
  sMascara, sAuxValor:String;
Begin
   If iNumDecimais < 0 then
      sMascara := '%17.0f'
   Else
      sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

   sAuxValor := trim(Format(sMascara,[rValor]));

   While Pos('.',sAuxValor) <> 0 Do
      Delete(sAuxValor,Pos('.',sAuxValor),1);

   Result := StrToFloat(sAuxValor)
End;


end.
