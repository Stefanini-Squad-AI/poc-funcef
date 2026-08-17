unit FAtuFluxoPrevisto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, Buttons, TB97, ExtCtrls,
  ComCtrls, Db, DBTables, Wwquery, Wwdatsrc, TREdit, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  StdCtrls;

type
  TfrmAtuFluxoPrevisto = class(TfrmSairAjuda)
    pnlComentario: TPanel;
    pnlDatas: TPanel;
    gbDatas: TGroupBox;
    lblDataInicial: TLabel;
    dedInicial: TCMDateTimePicker;
    lblDataFinal: TLabel;
    dedFinal: TCMDateTimePicker;
    mmComentario: TMemo;
    bbtnAtualizaFluxo: TBitBtn;
    prgBarAtuFluxo: TProgressBar;
    dsFluxoPrev: TwwDataSource;
    qryDocumento: TwwQuery;
    qryFluxoPrev: TwwQuery;
    qryParamGlobal: TwwQuery;
    qryAux: TwwQuery;
    qryCotacaoMoeda: TwwQuery;
    qryLanctoDocum: TwwQuery;
    qryRateioDocum: TwwQuery;
    qryFatura: TwwQuery;
    gbSaldoInicial: TGroupBox;
    reSaldoInicial: TRealEdit;
    qryTipoReceb: TwwQuery;
    qryPortadorForma: TwwQuery;
    qryOrcamento: TwwQuery;
    qryInvestimento: TwwQuery;
    qryCompInv: TwwQuery;
    qrySaldo: TwwQuery;
    qryComposicao: TwwQuery;
    qryTipoDocRec: TwwQuery;
    procedure bbtnAtualizaFluxoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FazerSaldoDocum;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    rCodTipoDocInvest : Real;
  public
    { Public declarations }
  end;

var
  frmAtuFluxoPrevisto: TfrmAtuFluxoPrevisto;
  sTipoRD,cCRespon,sCodDocumento,sCodDocSaldo:string;
  rValorCotacao,rSaldoCorrente,rSaldoMoeda,rTotalDocumento,rTotalDocOM:Real;
  rTotalDocGeral,rTotalDocOMGeral:Real;
  data : TDateTime;
  iABC : Integer;
implementation

{$R *.DFM}
uses uMensErro,uDataBase, DBaseDados,uSistema,UFuncaoGeral,uLancFinanc;

procedure TfrmAtuFluxoPrevisto.FormCreate(Sender: TObject);
begin
   inherited;
   //Busca Código de Documento dos Investimentos
   qryAux.Close;
   qryAux.SQL.Text:='SELECT CODTIPDOCINVEST FROM PARAMFINANC WHERE (IDPESSOA='+
                    IntToStr(Sistema.IdEmpresa)+')';
   qryAux.Open;
   if qryAux.FieldByName('CODTIPDOCINVEST').AsFloat<>0 then
      rCodTipoDocInvest:=qryAux.FieldByName('CODTIPDOCINVEST').AsFloat
   else
      rCodTipoDocInvest:=-1;   
   qryAux.Close;
end;

procedure TfrmAtuFluxoPrevisto.bbtnAtualizaFluxoClick(Sender: TObject);
var
iTipoDocRec,iUnidNegoc,iDMais,iCodLancFinan:LongInt;
sCentroRespon:String;
bLanca:Boolean;
rSaldoTot,rSaldoTotOM,rSaldoDoc1,rSaldoOM1 : Real;
begin
  inherited;
  bbtnAtualizaFluxo.Enabled := false;
  prgBarAtuFluxo.Visible := true;
  try
    StartTransacao;
    iCodLancFinan:=0;
    //
    qryParamGlobal.Close;
    qryParamGlobal.SQL.Clear;
    qryParamGlobal.SQL.Text := 'SELECT USAABC,UNIDNEGOC,CODCENTRORESPON FROM '+
                               'PARAMGLOBAL WHERE IDPESSOA = ' + InttoStr(Sistema.IdEmpresa);
    qryParamGlobal.Open;
    iABC     := qryParamGlobal.FieldByName('UNIDNEGOC').AsInteger;
    cCRespon := qryParamGlobal.FieldByName('CODCENTRORESPON').AsString;
    //
    qryTipoReceb.Close;
    qryTipoReceb.SQL.Clear;
    qryTipoReceb.SQL.Text := 'SELECT * FROM '+
                             'TIPORECEBDESEMB WHERE ANASINT = ''A'' AND RECPAG = ''R'' AND IDPESSOA = '+
                             InttoStr(Sistema.idempresa);
    qryTipoReceb.Open;
    qryTipoReceb.First;
    sTipoRD:=qryTipoReceb.FieldByName('CODTIPRECDES').AsString;
    //
    qryTipoDocRec.Close;
    qryTipoDocRec.Open;
    qryTipoDocRec.First;
    iTipoDocRec:=qryTipoDocRec.FieldByName('CODTIPDOC').AsInteger;
    //
    qryfluxoprev.Close;
    qryfluxoprev.SQL.Clear;
    qryfluxoprev.SQL.Text := 'DELETE FLUXOPREVISTO WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa);
    qryFluxoPrev.ExecSQL;
    //
    qryDocumento.close;
    qryDocumento.SQL.Clear;
    qryDocumento.SQL.Text :=  'SELECT CODPORTFORMA,RECPAG,MOECODIGO,NUMFATURA,OPERACAO,CODDOCUMENTO,IDPESSOA,DATAPROGRAMADA FROM DOCUMENTO WHERE '+
                              'STATUS <> ''2'' AND DATAPROGRAMADA <= (TO_DATE (''' + dedFinal.text + ''',''dd/mm/yyyy'')+10) AND  '+
                              'DATAPROGRAMADA >= (TO_DATE (''' + dedInicial.text + ''',''dd/mm/yyyy'')-10) AND  '+
                              '(OPERACAO = ''1'' OR OPERACAO = ''2'' OR OPERACAO = ''3'' OR OPERACAO = ''10'' OR OPERACAO = ''11'' OR '+
                              'OPERACAO = ''12'' OR OPERACAO = ''13'' OR OPERACAO = ''14'') AND IDPESSOA = '+IntToStr(Sistema.IdEmpresa);
    qryDocumento.open;
    //
    qryOrcamento.Close;
    qryOrcamento.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
    qryOrcamento.ParamByName('DATAINI').AsString   := dedInicial.text;
    qryOrcamento.ParamByName('DATAFIM').AsString   := dedFinal.text;
    qryOrcamento.Open;
    //
    qryInvestimento.Close;
    qryInvestimento.ParamByName('DATAINI').AsString   := dedInicial.text;
    qryInvestimento.ParamByName('DATAFIM').AsString   := dedFinal.text;
    qryInvestimento.Open;
    //
    if qryInvestimento.isEmpty then
     begin
        if qryOrcamento.IsEmpty then
           prgBarAtuFluxo.Max := qryDocumento.RecordCount
        else
           prgBarAtuFluxo.Max := qryDocumento.RecordCount+qryOrcamento.RecordCount;
     end
    else
     begin
        if qryOrcamento.IsEmpty then
           prgBarAtuFluxo.Max := qryDocumento.RecordCount+qryInvestimento.RecordCount
        else
           prgBarAtuFluxo.Max := qryDocumento.RecordCount+qryOrcamento.RecordCount+qryInvestimento.RecordCount;
     end;
    prgBarAtuFluxo.Position:=0;
    //
    LancFinanc.GravaFluxoPrev(qryAux,qryFluxoPrev,cCRespon,'01/01/1900',sTipoRD,'R','N',
                              iABC,reSaldoInicial.Value,'',-1,-1,-1,iTipoDocRec);
    LancFinanc.GravaFluxoPrev(qryAux,qryFluxoPrev,cCRespon,DateToStr((dedInicial.Date-1)),
                              sTipoRD,'R','N',iABC,0,'',-1,-1,-1,iTipoDocRec);
    LancFinanc.GravaFluxoPrev(qryAux,qryFluxoPrev,cCRespon,DateToStr((dedInicial.Date)),
                              sTipoRD,'R','N',iABC,0,'',-1,-1,-1,iTipoDocRec);
    LancFinanc.GravaFluxoPrev(qryAux,qryFluxoPrev,cCRespon,DateToStr((dedFinal.Date)),
                              sTipoRD,'R','N',iABC,0,'',-1,-1,-1,iTipoDocRec);
    //
    qryDocumento.First;
    while (not qryDocumento.eof) do
    begin
       prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
       rTotalDocGeral  :=0;
       rTotalDocOMGeral:=0;
       rTotalDocumento :=0;
       rTotalDocOM     :=0;
       iDMais          :=0;
       bLanca          :=True;

       if qrydocumento.fieldbyname('CODPORTFORMA').asInteger <> 0 then
       begin
          //
          qryPortadorForma.Close;
          qryPortadorForma.SQL.Clear;
          qryPortadorForma.SQL.Text := 'SELECT DMAIS FROM PORTADORFORMA WHERE CODPORTFORMA = '+qrydocumento.fieldbyname('CODPORTFORMA').asString;
          qryPortadorForma.Open;
          //
          if qrydocumento.fieldbyname('RECPAG').asString = 'P' then
             iDMais:=qryPortadorForma.FieldByName('DMAIS').AsInteger*(-1)
          else
             iDMais:=qryPortadorForma.FieldByName('DMAIS').AsInteger;

          if qryPortadorForma.FieldByName('DMAIS').AsInteger = 999 then
             bLanca:=False;
       end;

       if bLanca = True Then
       begin
          sCodDocSaldo:=qryDocumento.FieldByName('CODDOCUMENTO').asString;
          FazerSaldoDocum;
          data   :=(qrydocumento.fieldbyname('dataprogramada').asDateTime+iDMais);
          if DayOfWeek(Data) = 1 then
             data:=data+1;
          if DayOfWeek(Data) = 7 then
             data:=data+2;
          if qrydocumento.fieldbyname('moecodigo').asInteger <> 0  then
             rValorCotacao:=FuncaoGeral.TestaCotacaoMoeda(qrydocumento.fieldbyname('moecodigo').asinteger,DateToStr(Date),'N');
          if data < StrToDate(dedInicial.Text) then
             data:=(dedInicial.Date-1);
          if data <= dedFinal.Date then begin
             if (qryDocumento.FieldByName('OPERACAO').asInteger) in ([1,2,10,11,12,14]) then
             begin
                LancFinanc.FazerAcumulaRateio(qryRateioDocum,qryDocumento.FieldByName('CODDOCUMENTO').asString,rTotalDocumento,rTotalDocOM);
                rTotalDocGeral  :=rTotalDocumento;
                rTotalDocOMGeral:=rTotalDocOM;
                LancFinanc.FazerRateioDocum(qryRateioDocum,qryAux,qryFluxoPrev,0,qryDocumento.FieldByName('CODDOCUMENTO').asString,
                                            'FP',DateToStr(Data),rTotalDocGeral,rTotalDocOMGeral,rSaldoCorrente,
                                            rSaldoMoeda,rValorCotacao,iCodLancFinan,'','');
             end
             else
             begin
                qryFatura.close;
                qryFatura.SQL.Clear;
                qryFatura.SQL.Text := 'SELECT D.CODDOCUMENTO, L.VALOR, L.VALOROUTRAMOEDA FROM DOCUMENTO D, LANCTODOCUM L WHERE (D.NUMFATURA = '+qrydocumento.fieldbyname('NUMFATURA').asString+')'+
                                      ' AND (RTRIM(D.OPERACAO) = ''1'' OR RTRIM(D.OPERACAO) = ''11'') AND (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
                                      ' (D.OPERACAO = L.OPERACAO)';
                qryFatura.open;
                rTotalDocGeral  :=0;
                rTotalDocOMGeral:=0;
                qryFatura.First;
                while (not qryFatura.eof) do
                begin
                   rTotalDocumento :=0;
                   rTotalDocOM     :=0;
                   LancFinanc.FazerAcumulaRateio(qryRateioDocum,qryFatura.FieldByName('CODDOCUMENTO').asString,
                                                 rTotalDocumento,rTotalDocOM);
                   rTotalDocGeral  :=rTotalDocGeral  + rTotalDocumento;
                   rTotalDocOMGeral:=rTotalDocOMGeral+ rTotalDocOM;
                   qryFatura.Next;
                end;
                rSaldoTot  :=0;
                rSaldoTotOM:=0;
                qryFatura.First;
                while (not qryFatura.eof) do
                begin
                   if rTotalDocGeral <> 0 then
                      rSaldoDoc1 :=qryFatura.FieldByName('VALOR').asFloat*rSaldoCorrente/rTotalDocGeral
                   else
                      rSaldoDoc1 :=rSaldoCorrente;
                   if rTotalDocOMGeral <> 0 then
                      rSaldoOM1  :=qryFatura.FieldByName('VALOROUTRAMOEDA').asFloat*rSaldoMoeda/rTotalDocOMGeral
                   else
                      rSaldoOM1  :=rSaldoMoeda;
                   rSaldoDoc1 :=StrToFloat(Format('%17.2f',[rSaldoDoc1]));
                   rSaldoOM1  :=StrToFloat(Format('%17.2f',[rSaldoOM1]));
                   rSaldoTot  :=rSaldoTot   + rSaldoDoc1;
                   rSaldoTotOM:=rSaldoTotOM + rSaldoOM1;
                   LancFinanc.FazerRateioDocum(qryRateioDocum,qryAux,qryFluxoPrev,0,
                                               qryFatura.FieldByName('CODDOCUMENTO').asString,'FP',
                                               DateToStr(Data),rTotalDocGeral,rTotalDocOMGeral,
                                               rSaldoDoc1,rSaldoOM1,rValorCotacao,iCodLancFinan,'','');
                   qryFatura.Next;
                end;
             end;
          end;
       end;
       qryDocumento.next;
    end;
    //
    qryOrcamento.First;
    while not qryOrcamento.EOF do
    begin
       prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
       //
       qryComposicao.Close;
       qryComposicao.ParamByName('PLANOORC').AsInteger := qryOrcamento.FieldByName('IDPLANOORCAMEN').AsInteger;
       qryComposicao.ParamByName('CONTAORC').AsFloat   := qryOrcamento.FieldByName('IDCONTAORCAMEN').AsFloat;
       qryComposicao.Open;
       //
       data   :=qryOrcamento.fieldbyname('DATAREFERENCIA').asDateTime;
       if DayOfWeek(Data) = 1 then
          data:=data+1;
       if DayOfWeek(Data) = 7 then
          data:=data+2;
       qryComposicao.First;
       while not qryComposicao.EOF do
       begin
          //
          rSaldoCorrente:=(qryOrcamento.FieldByName('VALOR').asFloat/qryComposicao.FieldByName('NUMLINHAS').asFloat);
          if qryComposicao.FieldByName('CODCENTRORESPON').isNull then
             sCentroRespon:=qryParamGlobal.FieldByName('CODCENTRORESPON').AsString
          else
             sCentroRespon:=qryComposicao.FieldByName('CODCENTRORESPON').AsString;
          //
          if qryComposicao.FieldByName('UNIDNEGOC').isNull then
             iUnidNegoc:=qryParamGlobal.FieldByName('UNIDNEGOC').AsInteger
          else
             iUnidNegoc:=qryComposicao.FieldByName('UNIDNEGOC').AsInteger;
          LancFinanc.GravaFluxoPrev(qryAux,qryFluxoPrev,sCentroRespon,DateToStr(data),
                                    qryComposicao.FieldByName('CODTIPRECDES').AsString,
                                    qryComposicao.FieldByName('RECPAG').AsString,'S',
                                    iUnidNegoc,rSaldoCorrente,qryComposicao.FieldByName('CODCENTROCUSTO').AsString,-1,
                                    qryComposicao.FieldByName('IDPATRO').AsFloat,
                                    qryComposicao.FieldByName('IDPLANOPREV').AsFloat,
                                    qryComposicao.FieldByName('CODTIPDOC').AsFloat);
          qryComposicao.Next;
       end;
       qryOrcamento.Next;
    end;
    
    qryInvestimento.First;
    while not qryInvestimento.EOF do begin
       prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
       //
       qryCompInv.Close;
       qryCompInv.ParamByName('IDPADRLANCCONT').AsInteger:=qryInvestimento.FieldByName('IDPADRLANCCONT').AsInteger;
       qryCompInv.Open;
       if not qryCompInv.IsEmpty then begin
          //
          data   :=qryInvestimento.fieldbyname('DATAVENCTITRENFIX').asDateTime;
          if DayOfWeek(Data) = 1 then
             data:=data+1;
          if DayOfWeek(Data) = 7 then
             data:=data+2;
          if qryCompInv.FieldByName('RECPAG').AsString = 'P' then
             rSaldoCorrente:=qryInvestimento.FieldByName('VALOR').AsFloat*-1
          else
             rSaldoCorrente:=qryInvestimento.FieldByName('VALOR').AsFloat;
          if qryCompInv.FieldByName('CODCENTRORESPON').isNull then
             sCentroRespon:=qryParamGlobal.FieldByName('CODCENTRORESPON').AsString
          else
             sCentroRespon:=qryCompInv.FieldByName('CODCENTRORESPON').AsString;
          //
          if qryCompInv.FieldByName('UNIDNEGOC').isNull then
             iUnidNegoc:=qryParamGlobal.FieldByName('UNIDNEGOC').AsInteger
          else
             iUnidNegoc:=qryCompInv.FieldByName('UNIDNEGOC').AsInteger;
          LancFinanc.GravaFluxoPrev(qryAux,qryFluxoPrev,sCentroRespon,DateToStr(data),
                                    qryCompInv.FieldByName('CODTIPRECDES').AsString,
                                    qryCompInv.FieldByName('RECPAG').AsString,'S',
                                    iUnidNegoc,rSaldoCorrente,'',-1,-1,-1,rCodTipoDocInvest);
       //
       end;
       qryInvestimento.Next;
    end;
    //
    CommitTransacao;
    prgBarAtuFluxo.Visible := false;
    MsgDlg('Geração Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
    bbtnSairClick(Self);
  except
    MsgDlg('Problemas na Geração deste Novo Fluxo Previsto. Fluxo Previsto não foi Gerado.','Erro',mtError,[mbOk],0);
    RollBackTransacao;
    raise;
  end;
  prgBarAtuFluxo.Visible := false;
  bbtnAtualizaFluxo.Enabled := True;
end;

procedure TfrmAtuFluxoPrevisto.FormActivate(Sender: TObject);
begin
  inherited;
  qrySaldo.Close;
  qrySaldo.ParamByName('pDataRef').AsString    := DateToStr(Date);
  qrySaldo.ParamByName('pIdEmpresa').AsInteger := Sistema.IdEmpresa;
  qrySaldo.Open;
  if not qrySaldo.IsEmpty then
     reSaldoInicial.Value := qrySaldo.FieldByName('SALDO').AsFloat;
  bbtnAtualizaFluxo.Enabled := True;
end;

procedure TfrmAtuFluxoPrevisto.FazerSaldoDocum;
begin
   qryLanctoDocum.Close;
   qryLanctoDocum.SQL.Clear;
   qryLanctoDocum.SQL.Text :=  'SELECT OPERACAO,VALOR,DEBCRE,VALOROUTRAMOEDA FROM '+Sistema.PrefixoServidor+'LANCTODOCUM WHERE CODDOCUMENTO = '+sCodDocSaldo;
   qryLanctoDocum.open;
   qryLanctoDocum.First;
   rSaldoCorrente:=0;
   rSaldoMoeda:=0;
   while (not qryLanctoDocum.Eof) do
   begin
      if ((qryDocumento.FieldByName('RECPAG').asString = 'R') and (qryLanctoDocum.FieldByName('DEBCRE').asString = 'D')) or
         ((qryDocumento.FieldByName('RECPAG').asString = 'P') and (qryLanctoDocum.FieldByName('DEBCRE').asString = 'C')) then
      begin
         rSaldoCorrente:= rSaldoCorrente + qryLanctoDocum.FieldByName('VALOR').asFloat;
         rSaldoMoeda:= rSaldoMoeda + qryLanctoDocum.FieldByName('VALOROUTRAMOEDA').asFloat;
      end
      else
      begin
         rSaldoCorrente:= rSaldoCorrente - qryLanctoDocum.FieldByName('VALOR').asFloat;
         rSaldoMoeda   := rSaldoMoeda    - qryLanctoDocum.FieldByName('VALOROUTRAMOEDA').asFloat;
      end;
      qryLanctoDocum.Next;
   end;
end;


end.

