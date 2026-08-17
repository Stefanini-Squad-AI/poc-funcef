unit FAtuFluxoOrcLP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Mask, wwdbedit, Wwdbspin, Db,
  DBTables, Wwquery, wwdblook, CMDBLookupCombo;

type
  TfrmAtuFluxoOrcLP = class(TfrmSairAjuda)
    bbtnAtualizaFluxo: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    pnlComentario: TPanel;
    mmComentario: TMemo;
    pnlDatas: TPanel;
    prgBarAtuFluxo: TProgressBar;
    qryPeriodo: TwwQuery;
    gbPeriodos: TGroupBox;
    dblcPeriodoIni: TCMDBLookupCombo;
    dblcExercicio: TCMDBLookupCombo;
    lblExercicio: TLabel;
    dblcPeriodoFim: TCMDBLookupCombo;
    qryExercicio: TwwQuery;
    lblInicio: TLabel;
    lblFinal: TLabel;
    qryPerData: TwwQuery;
    qrySaldo: TwwQuery;
    qryComposicao: TwwQuery;
    qryFluxoOrc: TwwQuery;
    qryParamGlobal: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure dblcExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnAtualizaFluxoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtuFluxoOrcLP: TfrmAtuFluxoOrcLP;

implementation

uses uMensErro,uDataBase, DBaseDados,UIntegraBack,uSistema,UFuncaoGeral;

{$R *.DFM}

procedure TfrmAtuFluxoOrcLP.FormCreate(Sender: TObject);
begin
  inherited;
  //
  qryExercicio.Close;
  qryExercicio.ParamByName('IDPESSOA').AsInteger  := Sistema.idEmpresa;
  qryExercicio.Open;
  //
  qryPeriodo.Close;
  qryPeriodo.ParamByName('IDPESSOA').AsInteger  := -1;
  qryPeriodo.ParamByName('EXERCICIO').AsInteger := -1;
  qryPeriodo.Open;
  //
  qryComposicao.Close;
  qryComposicao.Prepare;
  //
end;

procedure TfrmAtuFluxoOrcLP.dblcExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  gbPeriodos.Enabled := True;
  //
  qryPeriodo.Close;
  qryPeriodo.ParamByName('IDPESSOA').AsInteger  := Sistema.idEmpresa;
  qryPeriodo.ParamByName('EXERCICIO').AsInteger := StrToInt(dblcExercicio.LookupValue);
  qryPeriodo.Open;
  //
end;

procedure TfrmAtuFluxoOrcLP.bbtnAtualizaFluxoClick(Sender: TObject);
var sDataIni, sDataFim : String;
    sValorCorrente,sSql,sCentroRespon:String;
    iUnidNegoc:LongInt;
begin
  inherited;
  //
  qryParamGlobal.Close;
  qryParamGlobal.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryParamGlobal.Open;
  //
  qryPerData.Close;
  qryPerData.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryPerData.ParamByName('EXERCICIO').AsInteger:= StrToInt(dblcExercicio.LookupValue);
  qryPerData.ParamByName('PERIODO').AsInteger  := StrToInt(dblcPeriodoIni.LookupValue);
  qryPerData.Open;
  sDataIni:=qryPerData.FieldByName('DATAINIPERIODO').AsString;
  //
  qryPerData.Close;
  qryPerData.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryPerData.ParamByName('EXERCICIO').AsInteger:= StrToInt(dblcExercicio.LookupValue);
  qryPerData.ParamByName('PERIODO').AsInteger  := StrToInt(dblcPeriodoFim.LookupValue);
  qryPerData.Open;
  sDataFim:=qryPerData.FieldByName('DATAFIMPERIODO').AsString;
  //
  bbtnAtualizaFluxo.Enabled := false;
  prgBarAtuFluxo.Visible := true;
  try
     StartTransacao;
     //
     qryFluxoOrc.Close;
     qryFluxoOrc.SQL.Clear;
     qryFluxoOrc.SQL.Text := 'DELETE FLUXOORCADO WHERE DATAPROGRAMADA >= TO_DATE (''' + sDataIni + ''',''dd/mm/yyyy'') AND DATAPROGRAMADA <= TO_DATE (''' + sDataFim + ''',''dd/mm/yyyy'') AND PRAZO = ''L'' AND IDPESSOA = '+IntToStr(Sistema.IdEmpresa);
     qryFluxoOrc.ExecSQL;
     //
     qrySaldo.Close;
     qrySaldo.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
     qrySaldo.ParamByName('DATAINI').AsString   := sDataIni;
     qrySaldo.ParamByName('DATAFIM').AsString   := sDataFim;
     qrySaldo.Open;
     if qrySaldo.IsEmpty then
     Begin
        MsgDlg('Não existe nenhum Orçamento neste Período','Erro',mtError,[mbOk],0);
        Abort;
     end;
     //
     prgBarAtuFluxo.Max      := qrySaldo.RecordCount;
     prgBarAtuFluxo.Position := 0;
     qrySaldo.First;
     While not qrySaldo.EOF do begin
        prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
        //
        qryComposicao.Close;
        qryComposicao.ParamByName('PLANOORC').AsInteger := qrySaldo.FieldByName('IDPLANOORCAMEN').AsInteger;
        qryComposicao.ParamByName('CONTAORC').AsString   := qrySaldo.FieldByName('IDCONTAORCAMEN').AsString;
        qryComposicao.Open;
        //
        qryComposicao.First;
        While not qryComposicao.EOF do begin
           sValorCorrente:=FuncaoGeral.OraNumero(qrySaldo.FieldByName('VLRORCADO').asFloat/
                                                 qryComposicao.FieldByName('NUMLINHAS').asFloat);
           if qryComposicao.FieldByName('CODCENTRORESPON').isNull then
              sCentroRespon:=qryParamGlobal.FieldByName('CODCENTRORESPON').AsString
           else
              sCentroRespon:=qryComposicao.FieldByName('CODCENTRORESPON').AsString;
           //
           if qryComposicao.FieldByName('UNIDNEGOC').isNull then
              iUnidNegoc:=qryParamGlobal.FieldByName('UNIDNEGOC').AsInteger
           else
              iUnidNegoc:=qryComposicao.FieldByName('UNIDNEGOC').AsInteger;

           sSql := 'INSERT INTO FLUXOORCADO(IDFLUXOORCADO,IDPESSOA,DATAPROGRAMADA,CODTIPRECDES,RECPAG,UNIDNEGOC,'+
                   'CODCENTRORESPON,PRAZO,VALOR,CODTIPDOC) VALUES ('+FloatToStr(LeUltRegistro(nil,'FLUXOORCADO'));
           sSql := sSql+', '+IntToStr(Sistema.IdEmpresa);
           sSql := sSql+', TO_DATE (''' +qrySaldo.FieldByName('DATAREFERENCIA').asString+ ''',''DD/MM/YYYY'')';
           sSql := sSql+',''' +qryComposicao.FieldByName('CODTIPRECDES').asString+ '''';
           sSql := sSql+',''' +qryComposicao.FieldByName('RECPAG').asString+ '''';
           sSql := sSql+','+IntToStr(iUnidNegoc);
           sSql := sSql+',''' +sCentroRespon+ '''';
           sSql := sSql+',''L''';
           sSql := sSql+','+sValorCorrente;
           if qryComposicao.FieldByName('CODTIPDOC').AsFloat<>0 then
              sSql := sSql+','+FloatToStr(qryComposicao.FieldByName('CODTIPDOC').AsFloat)+')'
           else
              sSql := sSql+',null)';
           qryFluxoOrc.SQL.Clear;
           qryFluxoOrc.SQL.Text:=sSql;
           qryFluxoOrc.ExecSQL;
           //
           qryComposicao.Next;
        end;
        //
        qrySaldo.Next;
     end;
     CommitTransacao;
     prgBarAtuFluxo.Visible := false;
     MsgDlg('Geração Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
     bbtnSairClick(Self);
  except
     MsgDlg('Problemas na Geração do Fluxo Orçado','Erro',mtError,[mbOk],0);
     RollBackTransacao;
     raise;
  end;
  prgBarAtuFluxo.Visible := false;
  bbtnAtualizaFluxo.Enabled := True;
  //
end;

procedure TfrmAtuFluxoOrcLP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryComposicao.Close;
  qryComposicao.UnPrepare;
end;

procedure TfrmAtuFluxoOrcLP.FormActivate(Sender: TObject);
begin
  inherited;
  gbPeriodos.Enabled := False;
  dblcExercicio.SetFocus;
end;

end.
