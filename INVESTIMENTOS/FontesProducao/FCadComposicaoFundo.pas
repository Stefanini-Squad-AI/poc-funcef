unit FCadComposicaoFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdbedit, Mask, wwdblook, DBCtrls2, TREdit, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, fcLabel;

type
  TfrmCadComposicaoFundo = class(TfrmCadMestreDetalheCS)
    qryDetalhe: TwwQuery;
    updDetalhe: TUpdateSQL;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    qryInvest: TwwQuery;
    dsInvest: TwwDataSource;
    qryDetalheIDCOMPOSICAOFUNDO: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheIDFUNDOINVESTCOMP: TFloatField;
    qryDetalheTRGDTINCLUSAO: TDateTimeField;
    qryDetalheTRGUSERINCLUSAO: TStringField;
    qryDetalheDESCFUNDOINVEST: TStringField;
    qryDetalheDESCTIPOFUNDOINV: TStringField;
    qryInvestIDFUNDOINVEST: TFloatField;
    qryInvestDESCFUNDOINVEST: TStringField;
    qryInvestDESCTIPOFUNDOINV: TStringField;
    qryFundoInvestComp: TwwQuery;
    qryFundoInvestCompDESCFUNDOINVEST: TStringField;
    qryFundoInvestCompDESCTIPOFUNDOINV: TStringField;
    qryFundoInvestCompIDFUNDOINVEST: TFloatField;
    dblComposicao: TwwDBLookupCombo;
    Label3: TLabel;
    Bevel1: TBevel;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure StatusGeral;
    procedure StatusInclui;
    procedure StatusAltera;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadComposicaoFundo: TfrmCadComposicaoFundo;

implementation

uses UDataBase, UOperComum, UmensErro, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmCadComposicaoFundo.FormShow(Sender: TObject);
begin
  inherited;
 //Abre Qry's                                                       
  qryInvest.Close;                                   
  qryInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryInvest.Open;

  qryFundoInvestComp.Close;
  qryFundoInvestComp.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryFundoInvestComp.Open;

  qryDetalhe.Close;  
  qryDetalhe.Open;
  dbgrdDet.BringToFront;

  StatusGeral;

end;

procedure TfrmCadComposicaoFundo.bbtnOkDetClick(Sender: TObject);
begin
  Try
    if dblComposicao.LookupValue = '' then
    begin
       MsgDlg('Composição não selecionada','Erro',mtError,[mbOK],0);
       dblComposicao.SetFocus;
       Exit;
    end;

    if dblComposicao.LookupValue = dblInvest.LookupValue then
    begin
       MsgDlg('O Fundo não pode ser composto por ele mesmo.','Erro',mtError,[mbOK],0);
       dblComposicao.SetFocus;
       Exit;
    end;

    if QryDetalhe.State = dsInsert then
       QryDetalhe.FieldByName('IDCOMPOSICAOFUNDO').AsInteger := LeUltRegistro(nil, 'COMPOSICAOFUNDO');

    QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);

    QryDetalhe.FieldByName('IDFUNDOINVESTCOMP').AsInteger := StrToInt(dblComposicao.LookupValue);

    bbtnConfirmar.Enabled := True;

    pnlControlesDet.SendToBack;

    qryDetalhe.post;

    inherited;

    AplicaAlteracoes([qryDetalhe]);

    CmeDetalhe.Cancel(Self);

    qryDetalhe.Close;
    qryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.LookupValue);
    qryDetalhe.Open;

    StatusGeral;
  Except
    bbtnCancelarDetClick(Sender);
  End;
end;

procedure TfrmCadComposicaoFundo.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadComposicaoFundo.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  StatusGeral;
  qryDetalhe.Close;
  qryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.LookupValue);
  qryDetalhe.Open;
end;

procedure TfrmCadComposicaoFundo.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  StatusInclui;
end;

procedure TfrmCadComposicaoFundo.sbtnExcluiDetClick(Sender: TObject);
begin
 if (not qryDetalhe.IsEmpty) then
 begin
    if (MsgDlg('Deseja realmente excluir este Fundo desta Composição?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
    begin
       inherited;
       aplicaAlteracoes([qryDetalhe]);
    end;
 end;
 StatusGeral;
end;

procedure TfrmCadComposicaoFundo.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  StatusAltera;
end;

procedure TfrmCadComposicaoFundo.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDet.Click
end;

procedure TfrmCadComposicaoFundo.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  StatusGeral;
end;

procedure TfrmCadComposicaoFundo.sbtnProcurarClick(Sender: TObject);
var x: Integer;
    wDisplay: String;
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;

  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  dblInvest.Enabled := True;

  if MontaSelect.RetornouValor then
  begin
     dblInvest.LookupValue := MontaSelect.ValoresChave[0];
     dblInvest.PerformSearch;

     qryDetalhe.Close;
     qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger := StrToInt(montaSelect.ValoresChave[0]);
     qryDetalhe.Open;
  end;

  StatusGeral;

end;

procedure TfrmCadComposicaoFundo.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var x: integer;
    wDisplay: String;
begin
   if dblInvest.lookupvalue <> '' then
   begin
      inherited;
      qryDetalhe.Close;
      qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger := StrToInt(dblInvest.LookupValue);
      qryDetalhe.Open;
      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
      dblInvest.Enabled     := True;
   end;
  StatusGeral;
end;

procedure TfrmCadComposicaoFundo.StatusGeral;
begin
   dblInvest.Enabled    := True;
   sbtnProcurar.Enabled := True;

   if Trim(dblInvest.Text) = '' then
   begin
      sbtnInsDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnExcluiDet.Enabled := False;
      dbgrdDet.Enabled := False;
   end
   else
   begin
      if qryDetalhe.IsEmpty then
      begin
         sbtnInsDet.Enabled := True;
         sbtnAltDet.Enabled := False;
         sbtnExcluiDet.Enabled := False;
         dbgrdDet.Enabled := False;
      end
      else
      begin
         sbtnInsDet.Enabled := True;
         sbtnAltDet.Enabled := True;
         sbtnExcluiDet.Enabled := True;
         dbgrdDet.Enabled := True;
      end;
   end;
   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
   bbtnVoltarDet.Enabled := False;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;
end;

procedure TfrmCadComposicaoFundo.StatusInclui;
begin
   sbtnProcurar.Enabled := False;
   dblInvest.Enabled := False;

   sbtnAltDet.Enabled := False;
   sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled := True;
end;

procedure TfrmCadComposicaoFundo.StatusAltera;
begin
   sbtnProcurar.Enabled := False;
   dblInvest.Enabled := False;

   sbtnInsDet.Enabled := False;
   sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled := True;

end;

procedure TfrmCadComposicaoFundo.FormCreate(Sender: TObject);
begin
  inherited;
  if iTipoInvestUsu <> 0 then
     MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));
end;

end.
