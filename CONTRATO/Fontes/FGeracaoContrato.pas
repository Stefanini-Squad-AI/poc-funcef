unit FGeracaoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, Wwdatsrc, DBTables,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmGeracaoContrato = class(TfrmOkCancelar)
    ProgressBarGeracao: TProgressBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    deDataLanc: TCMDateTimePicker;
    updParcela: TUpdateSQL;
    qryParcela: TwwQuery;
    dsParcela: TwwDataSource;
    qryDadosCli: TwwQuery;
    qryDadosFor: TwwQuery;
    qryAuxFuncao: TwwQuery;
    qryRateioCC: TwwQuery;
    qryDadosContrato: TwwQuery;
    qryAtuObjContr: TwwQuery;
    qryParamContrato: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
     sOperacao : String;
     procedure GeraDados;
  public
    { Public declarations }
  end;

var
  frmGeracaoContrato: TfrmGeracaoContrato;
  iEmpresaProp,liExercicio,liPeriodo,liRetFuncao,
  IdPatro,IdPrograma,IdPlanoPrev:LongInt;

implementation

uses USistema,UMensErro,uDataBase,dBasedados, uDocumento,uModulo,
     uFuncaoGeral,uLancContab,uIntegraBack, uImpostoRetido;
{$R *.DFM}

procedure TfrmGeracaoContrato.bbtnConfirmarClick(Sender: TObject);
var dDataRef: TDateTime;
    sMens   : String;
begin
   inherited;
   liRetFuncao := 0;
   iEmpresaProp:= Sistema.IdEmpresa;
   liExercicio := 0;
   liPeriodo   := 0;
   if IntegraBack.Contabilidade = 'S' then
    begin
       liRetFuncao:=TestaPeriodo(True,'BaseDados',deDataLanc.Text,IntToStr(Sistema.IdModulo),liExercicio,
                                 liPeriodo,iEmpresaProp,sMens);
    end;

   if liRetFuncao <> 0 then exit;

   qryDadosContrato.Close;
   qryDadosContrato.ParamByName('IDPESSOA').AsInteger:=Sistema.idEmpresa;
   qryDadosContrato.ParamByName('IDUSUARIO').AsInteger:=Sistema.idUsuario;
   qryDadosContrato.Open;

   if Sistema.UsaPlanoPatro then
    begin
       IdPatro    := qryDadosContrato.FieldByName('IDPATRO').AsInteger;
       IdPrograma := -1;
       IdPlanoPrev:= qryDadosContrato.FieldByName('IDPLANOPREV').AsInteger;
    end
   else
    begin
       IdPatro    := -1;
       IdPrograma := -1;
       IdPlanoPrev:= -1;
    end;
   //
   ProgressBarGeracao.Max:= qryDadosContrato.RecordCount;
   ProgressBarGeracao.Position :=0;
   ProgressBarGeracao.visible := true;
   try
      StartTransacao;
      //
      qryParcela.Close;
      qryParcela.Open;
      //
      qryDadosContrato.First;
      while not qryDadosContrato.EOF do
      begin
         if qryDadosContrato.FieldByName('DATAULTGERACAO').isNull then
            dDataRef:=(qryDadosContrato.FieldByName('DATABASEITEM').AsDateTime-1)
         else
            dDataRef:=qryDadosContrato.FieldByName('DATAULTGERACAO').AsDateTime;
         //
         if deDataLanc.Date > dDataRef then GeraDados;
         ProgressBarGeracao.Position := ProgressBarGeracao.Position + 1;
         qryDadosContrato.Next;
      end;
      qryParcela.ApplyUpdates;
      qryParcela.CommitUpdates;
      CommitTransacao;
      MsgDlg('Geração efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
   except
      qryParcela.CancelUpdates;
      RollBackTransacao;
      MsgDlg('Lançamentos não efetuados','Erro',mtError,[mbOk],0);
      raise;
   end;
   ProgressBarGeracao.visible := False;
end;

procedure TfrmGeracaoContrato.GeraDados;
var iNumParcela,iCodLancCAPCAR,iSubContaCli,iCodPortForma,iNumLancto,
    iPlnCodigoP,iPlnCodigo,iMoeCodigo,iNumFatura:LongInt;
    sSubContaCli,sNomeEmp,sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico,sMens,
    sDebCre,sRecPag,sPlano,sContaCliFor,sCCustoCliFor,sStatus :String;
    sContaD,sContaC,sSubContaD,sSubContaC,sCCustoD,sCCustoC : String;
    rValTot,rValor:Real;
    bBloq:Boolean;
    iFrequencia : Integer;
    dDataVenc:TDateTime;
    bPartidaDobrada  : Boolean;
begin
   bPartidaDobrada:=False;
   with TQuery.Create(nil) do
   try
      DatabaseName:='BaseDados';
      Sql.Text:='SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = '+
                                   FloatToStr(Sistema.IdEmpresa)+') ';
      Open;
      bPartidaDobrada:=(FieldByName('PACDOBRADA').AsString='S');
   finally
      Free;
   end;

   iNumParcela := LeUltRegistro(nil, 'PARCELAREALCONTR');
   
   if qryDadosContrato.FieldByName('DATAULTGERACAO').isNull then
      dDataVenc := qryDadosContrato.FieldByName('DATAINICIOCOBR').AsDateTime
   else
    begin
       if qryDadosContrato.FieldByName('FREQUENCIA').AsString = 'M' then
          iFrequencia :=30
       else
        if qryDadosContrato.FieldByName('FREQUENCIA').AsString = 'D' then
           iFrequencia :=1
        else
         if qryDadosContrato.FieldByName('FREQUENCIA').AsString = 'A' then
            iFrequencia :=365
         else
            iFrequencia :=1;
       dDataVenc := qryDadosContrato.FieldByName('DATAULTVENC').AsDateTime+
                    (qryDadosContrato.FieldByName('INTERVALO').AsInteger * iFrequencia);
    end;
   iPlnCodigo    :=0;
   sContaCliFor  :='';
   sCCustoCliFor :='';
   iSubContaCli  :=-1;
   sSubContaCli  :='';
   sPlano        :='';
   //
   if qryDadosContrato.FieldByName('TIPOCONTRATO').AsString = 'A' then
    begin
       sRecPag := 'R';
       sDebCre := 'D';
    end
   else
    begin
       sRecPag := 'P';
       sDebCre := 'C';
    end;

   if IntegraBack.Contabilidade = 'S' then
    begin
       if IntegraBack.Plano <> 0 then sPlano:=IntToStr(IntegraBack.Plano);
       
       if qryDadosContrato.FieldByName('TIPOCONTRATO').AsString = 'A' then
        begin
           qryDadosCli.Close;
           qryDadosCli.ParamByName('IDFORCLI').AsInteger:=qryDadosContrato.FieldByName('IDFORCLI').AsInteger;
           qryDadosCli.ParamByName('IDPESSOA').AsInteger:=Sistema.idEmpresa;
           qryDadosCli.Open;
           //
           sContaCliFor :=qryDadosCli.FieldByName('CONTACCLIENTE').AsString;
           sCCustoCliFor:=qryDadosCli.FieldByName('CODCENTROCUSTO').AsString;
           sSubContaCli :=qryDadosCli.FieldByName('CODSUBCONTA').AsString;
           iSubContaCli :=qryDadosCli.FieldByName('CODSUBCONTA').AsInteger;
           sNomeEmp     :=qryDadosCli.FieldByName('RAZAOSOCIAL').AsString;
           sContaD      :=sContaCliFor;
           sContaC      :=qryDadosContrato.FieldByName('PLACONTA').AsString;
           sSubContaD   :=qryDadosCli.FieldByName('CODSUBCONTA').AsString;
           sSubContaC   :=qryDadosContrato.FieldByName('CODSUBCONTA').AsString;
        end
       else
        begin
           qryDadosFor.Close;
           qryDadosFor.ParamByName('IDFORCLI').AsInteger:=qryDadosContrato.FieldByName('IDFORCLI').AsInteger;
           qryDadosFor.ParamByName('IDPESSOA').AsInteger:=Sistema.idEmpresa;
           qryDadosFor.Open;
           //
           sContaCliFor :=qryDadosFor.FieldByName('CONTACFORN').AsString;
           sCCustoCliFor:=qryDadosFor.FieldByName('CODCENTROCUSTO').AsString;
           sSubContaCli :=qryDadosFor.FieldByName('CODSUBCONTA').AsString;
           iSubContaCli :=qryDadosFor.FieldByName('CODSUBCONTA').AsInteger;
           sNomeEmp     :=qryDadosFor.FieldByName('RAZAOSOCIAL').AsString;
           sContaC      :=sContaCliFor;
           sContaD      :=qryDadosContrato.FieldByName('PLACONTA').AsString;
           sSubContaC   :=qryDadosFor.FieldByName('CODSUBCONTA').AsString;
           sSubContaD   :=qryDadosContrato.FieldByName('CODSUBCONTA').AsString;
        end;

       sHistorico   :='Lançamento doc. No. '+IntToStr(iNumParcela)+' '+sNomeEmp+' ref. contrato No. '+qryDadosContrato.FieldByName('IDCONTRATO').AsString;
       FuncaoGeral.ArrumaHistorico(sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);
       //
       qryRateioCC.Close;
       qryRateioCC.ParamByName('IDCONTRATO').AsInteger:=qryDadosContrato.FieldByName('IDCONTRATO').AsInteger;
       qryRateioCC.ParamByName('IDITEM').AsInteger    :=qryDadosContrato.FieldByName('IDITEM').AsInteger;
       qryRateioCC.ParamByName('IDOBJETO').AsInteger  :=qryDadosContrato.FieldByName('IDOBJETO').AsInteger;
       qryRateioCC.Open;
       //
       rValTot:=0;
       qryRateioCC.First;
       while not qryRateioCC.EOF do
       begin
          if qryDadosContrato.FieldByName('TIPOCONTRATO').AsString = 'A' then
           begin
              sCCustoD:=sCCustoCliFor;
              sCCustoC:=qryRateioCC.FieldByName('CODCENTROCUSTO').AsString;
           end
          else
           begin
              sCCustoC:=sCCustoCliFor;
              sCCustoD:=qryRateioCC.FieldByName('CODCENTROCUSTO').AsString;
           end;

          rValor :=StrToFloat(Format('%17.2f',[(qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat*qryRateioCC.FieldByName('PERCRATEIOCONTR').AsFloat/100)]));
          rValTot:=rValTot+rValor;

          if not(bPartidaDobrada) then
           begin
              iPlnCodigo:=LANCACONTAB(True,'BASEDADOS',
                                      deDataLanc.Text, InttoStr(Sistema.IdModulo),
                                      '0','D','','','','','','','','','','',
                                      IntToStr(iNumParcela),sHist1,sHist2,sHist3,sHist4,sHist5,
                                      '03', sCCustoD, sContaD,'','', liExercicio, liPeriodo,
                                      iEmpresaProp,Sistema.IdUsuario,IntegraBack.Plano,
                                      rValor,0,0,0,0,0,0,0,0,
                                      qryDadosContrato.FieldByName('UNIDNEGOC').AsString,True,0,0,
                                      sSubContaD,'','','', iPlnCodigo,sMens,
                                      IntegraBack.MascaraPlano,
                                      true,0,IDPLANOPREV,IDPATRO,Sistema.UsaPlanoPatro);


              if iPlnCodigo < 0 then Abort;
              //
              iPlnCodigo:=LANCACONTAB(True,'BASEDADOS',deDataLanc.Text, InttoStr(Sistema.IdModulo),'1',
                         'C','','','','','','','','','','',
                         IntToStr(iNumParcela),sHist1,sHist2,sHist3,sHist4,sHist5,
                         '03','','',sCCustoC,sContaC,liExercicio, liPeriodo,iEmpresaProp,Sistema.IdUsuario,
                         IntegraBack.Plano,rValor,
                         0,0,0,0,0,0,0,0,qryDadosContrato.FieldByName('UNIDNEGOC').AsString,True,0,0,
                         '',sSubContaC,'','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,true,0,
                         IDPLANOPREV,IDPATRO,Sistema.UsaPlanoPatro);
              if iPlnCodigo < 0 then Abort;
           end
          else
           begin
              iPlnCodigo:=LANCACONTAB(True,'BASEDADOS',deDataLanc.Text, InttoStr(Sistema.IdModulo),'2',
                         '','','','','','','','','','','',
                         IntToStr(iNumParcela),sHist1,sHist2,sHist3,sHist4,sHist5,
                         '03', sCCustoD, sContaD,sCCustoC,sContaC,liExercicio, liPeriodo,iEmpresaProp,Sistema.IdUsuario,
                         IntegraBack.Plano,rValor,
                         0,0,0,0,0,0,0,0,qryDadosContrato.FieldByName('UNIDNEGOC').AsString,True,0,0,
                         sSubContaD,sSubContaC,'','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,true,0,
                         IDPLANOPREV,IDPATRO,Sistema.UsaPlanoPatro);
              if iPlnCodigo < 0 then Abort;
           end;

          qryRateioCC.Next;
       end;

      //Acerta diferenca de arredondamento
      if Format('%17.2f',[qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat]) <>
         Format('%17.2f',[rValTot]) then
       begin
          rValor :=qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat - rValtot;

          if not(bPartidaDobrada) then
           begin
              iPlnCodigo:=LANCACONTAB(True,'BASEDADOS',deDataLanc.Text, InttoStr(Sistema.IdModulo),'0',
                         'D','','','','','','','','','','',
                         IntToStr(iNumParcela),sHist1,sHist2,sHist3,sHist4,sHist5,
                         '03', sCCustoD, sContaD,'','', liExercicio, liPeriodo,iEmpresaProp,Sistema.IdUsuario,
                         IntegraBack.Plano,rValor,
                         0,0,0,0,0,0,0,0,qryDadosContrato.FieldByName('UNIDNEGOC').AsString,True,0,0,
                         sSubContaD,'','','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,true,0,
                         IDPLANOPREV,IDPATRO,Sistema.UsaPlanoPatro);
              if iPlnCodigo < 0 then Abort;
              //
              iPlnCodigo:=LANCACONTAB(True,'BASEDADOS',deDataLanc.Text, InttoStr(Sistema.IdModulo),'1',
                         'C','','','','','','','','','','',
                         IntToStr(iNumParcela),sHist1,sHist2,sHist3,sHist4,sHist5,
                         '03','','',sCCustoC,sContaC,liExercicio, liPeriodo,iEmpresaProp,Sistema.IdUsuario,
                         IntegraBack.Plano,rValor,
                         0,0,0,0,0,0,0,0,qryDadosContrato.FieldByName('UNIDNEGOC').AsString,True,0,0,
                         '',sSubContaC,'','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,true,0,
                         IDPLANOPREV,IDPATRO,Sistema.UsaPlanoPatro);
              if iPlnCodigo < 0 then Abort;
           end
          else
           begin
              iPlnCodigo:=LANCACONTAB(True,'BASEDADOS',deDataLanc.Text, InttoStr(Sistema.IdModulo),'2',
                         '','','','','','','','','','','',
                         IntToStr(iNumParcela),sHist1,sHist2,sHist3,sHist4,sHist5,
                         '03',sCCustoD, sContaD,sCCustoC,sContaC,liExercicio, liPeriodo,iEmpresaProp,Sistema.IdUsuario,
                         IntegraBack.Plano,rValor,
                         0,0,0,0,0,0,0,0,qryDadosContrato.FieldByName('UNIDNEGOC').AsString,True,0,0,
                         sSubContaD,sSubContaC,'','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,true,0,
                         IDPLANOPREV,IDPATRO,Sistema.UsaPlanoPatro);
              if iPlnCodigo < 0 then Abort;
           end;
       end;
    end;
   Integraback.RecPag := sRecPag;
   iNumFatura:=0;
   sStatus:='';
   iCodLancCAPCAR:=Documento.GetCodigo(qryAuxFuncao);
   if iCodLancCAPCAR <= 0 then abort;
   if qryDadosContrato.FieldByName('MOECODIGO').AsInteger <> 0 then
      iMoeCodigo:=qryDadosContrato.FieldByName('MOECODIGO').AsInteger
   else
      iMoeCodigo:=-1;
   bBloq :=False;

   if qryDadosContrato.FieldByName('CODPORTFORMA').AsInteger <> 0 then
    begin
       iCodPortForma:=qryDadosContrato.FieldByName('CODPORTFORMA').AsInteger;
       if sRecPag = 'R' then bBloq:=True;
    end
   else
    iCodPortForma:=-1;

   Documento.Obs        := qryDadosContrato.FieldByName('OBSERVACAO').asString;
   Documento.Referencia := qryDadosContrato.FieldByName('CODCONTRATOEMPR').asString;
   //
   Documento.Inserir(qryAuxFuncao,iCodLancCAPCAR,IntToStr(Sistema.IdModulo),sPlano,
                     sContaCliFor,sCCustoCliFor,
                     iMoeCodigo,0,Sistema.IdEmpresa,qryDadosContrato.FieldByName('IDFORCLI').AsInteger,
                     qryDadosContrato.FieldByName('CODTIPDOC').AsInteger,
                     iCodPortForma,sRecPag,iNumParcela,'',deDataLanc.Text,
                     DateToStr(dDataVenc), DateToStr(dDataVenc),sStatus,
                     iNumFatura,sOperacao,Sistema.IdUsuario,iSubContaCli,-1,'','',bBloq,-1,-1,-1);
   //
   iNumLancto:=Documento.GerarNumLancto(qryAuxFuncao,iCodLancCAPCAR);
   if iNumLancto <= 0 then
      Abort;
   if iPlnCodigo > 0 then
      iPlnCodigoP:=iPlnCodigo
   else
      iPlnCodigoP:=-1;
   Documento.CriarLanctoDoc(qryAuxFuncao,iCodLancCAPCAR,iNumLancto,-1,iPlnCodigoP,
                  deDataLanc.Text,qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat,0,
                  -1,sDebCre,sOperacao,'',Sistema.IdUsuario,False,-1,'');
   //
   rValTot:=0;
   qryRateioCC.First;
   while not qryRateioCC.EOF do
   begin
      rValor   := StrToFloat(Format('%17.2f',[(qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat*qryRateioCC.FieldByName('PERCRATEIOCONTR').AsFloat/100)]));
      rValTot  := rValTot+rValor;
      Documento.Rateio.Inserir(iCodLancCAPCAR,qryDadosContrato.FieldByName('CODTIPRECDES').AsString,
                               sRecPag,qryDadosContrato.FieldByName('CODCENTRORESPON').AsString,
                               Sistema.IdEmpresa,rValor,0,Sistema.IdUsuario,qryDadosContrato.FieldByName('UNIDNEGOC').AsInteger,-1,
                               qryRateioCC.FieldByName('CODCENTROCUSTO').AsString,IDPATRO,
                               qryRateioCC.FieldByName('IDPROGRAMA').AsInteger,IDPLANOPREV);
      qryRateioCC.Next;
   end;
   
   // Caso haja diferença de arredondamento lança a diferença
   if rValTot <> qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat Then
    begin
       rValor := qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat - rValTot;
       qryRateioCC.First;
       Documento.Rateio.Inserir(iCodLancCAPCAR,qryDadosContrato.FieldByName('CODTIPRECDES').AsString,
                                sRecPag,qryDadosContrato.FieldByName('CODCENTRORESPON').AsString,
                                Sistema.IdEmpresa,rValor,0,Sistema.IdUsuario,qryDadosContrato.FieldByName('UNIDNEGOC').AsInteger,-1,
                                qryRateioCC.FieldByName('CODCENTROCUSTO').AsString,IDPATRO,
                                qryRateioCC.FieldByName('IDPROGRAMA').AsInteger,IDPLANOPREV);
     end;

   // Imposto Automático
   if Modulo.VerifImposto(qryDadosContrato.FieldByName('CODTIPRECDES').AsString,sRecPag) Then
    begin
       ImpostoRetido.DataProgramada    := dDataVenc;
       ImpostoRetido.OperacaoDocumento := sOperacao;
       ImpostoRetido.IdForCli          := qryDadosContrato.FieldByName('IDFORCLI').AsInteger;
       ImpostoRetido.CodDocumento      := iCodLancCAPCAR;
       ImpostoRetido.NumLancto         := iNumLancto;
       ImpostoRetido.ValorLancto       := qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat;
       ImpostoRetido.ValorLiquido      := qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat;
       ImpostoRetido.DataLancto        := StrToDate(deDataLanc.Text);
       ImpostoRetido.DataEmissao       := StrToDate(deDataLanc.Text);
       ImpostoRetido.CodTipoDoc        := qryDadosContrato.FieldByName('CODTIPDOC').AsInteger;
       ImpostoRetido.Incluir;
    end;

   //
   qryParcela.Append;
   qryParcela.FieldByName('IDPARCELA').AsInteger:=iNumParcela;
   qryParcela.FieldByName('IDCONTRATO').AsInteger:=qryDadosContrato.FieldByName('IDCONTRATO').AsInteger;
   qryParcela.FieldByName('PLNCODIGO').AsInteger:=iPlnCodigo;
   qryParcela.FieldByName('CODDOCUMENTO').AsInteger:=iCodLancCAPCAR;
   qryParcela.FieldByName('IDITEM').AsInteger:=qryDadosContrato.FieldByName('IDITEM').AsInteger;
   qryParcela.FieldByName('IDOBJETO').AsInteger:=qryDadosContrato.FieldByName('IDOBJETO').AsInteger;
   qryParcela.FieldByName('IDPESSOA').AsInteger:=Sistema.idEmpresa;
   qryParcela.FieldByName('DATAVENCPARCELA').AsDateTime:=dDataVenc;
   qryParcela.FieldByName('DATAREALPARCELA').AsDateTime:=StrToDate(deDataLanc.Text);
   qryParcela.FieldByName('QTDEPARCELA').AsFloat:=qryDadosContrato.FieldByName('QTDEITEM').AsFloat;
   qryParcela.FieldByName('VALOROBJPARCELA').AsFloat:=qryDadosContrato.FieldByName('VALORUNITARIOOBJETO').AsFloat;
   qryParcela.FieldByName('VLRMOEDACORRENTE').AsFloat:=qryDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat;
   qryParcela.Post;
   //
   qryAtuObjContr.Close;
   qryAtuObjContr.ParamByName('DATAULTGERACAO').AsDateTime:= deDataLanc.Date;
   qryAtuObjContr.ParamByName('DATAULTVENC').AsDateTime:=dDataVenc;
   qryAtuObjContr.ParamByName('IDCONTRATO').AsInteger:=qryDadosContrato.FieldByName('IDCONTRATO').AsInteger;
   qryAtuObjContr.ParamByName('IDITEM').AsInteger:=qryDadosContrato.FieldByName('IDITEM').AsInteger;
   qryAtuObjContr.ParamByName('IDOBJETO').AsInteger:=qryDadosContrato.FieldByName('IDOBJETO').AsInteger;
   qryAtuObjContr.ExecSql;
end;

procedure TfrmGeracaoContrato.FormCreate(Sender: TObject);
begin
  inherited;
  ImpostoRetido    := TImpostoRetido.Create;

  qryParamContrato.open;
  if qryParamContrato.FieldByName('flgengloba').AsBoolean then
     sOperacao := '1 '
  else
     sOperacao := '2 ';
  qryParamContrato.close;
end;

procedure TfrmGeracaoContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ImpostoRetido.Free;
end;

end.
