unit FCadTravasProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCsInv, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, faMensagem, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, wwdblook, CMDBLookupCombo, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmCadTravasProc = class(TFrmCadastroGridCSInv)
    qryDESCTIPOINVEST: TStringField;
    qryDESCTIPOINVESTRV: TStringField;
    qryDESCTPMERCADOBMF: TStringField;
    qryDESCTIPOFUNDOINV: TStringField;
    qryDESCCLASSETIT: TStringField;
    qryDESCINVESTIMENTO: TStringField;
    qryDESCFUNDOINVEST: TStringField;
    qryIDTRAVASPROC: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOINVESTRV: TFloatField;
    qryIDTIPOMERCADOBMF: TFloatField;
    qryIDTIPOFUNDOINVEST: TFloatField;
    qryIDCLASSETIT: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    qryTipoInvest: TwwQuery;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    qryTipoInvestRV: TwwQuery;
    qryTipoInvestRVIDTIPOINVESTRV: TFloatField;
    qryTipoInvestRVDESCTIPOINVESTRV: TStringField;
    qryTipoMercadoBMF: TwwQuery;
    qryTipoMercadoBMFIDTIPOMERCADOBMF: TFloatField;
    qryTipoMercadoBMFDESCTPMERCADOBMF: TStringField;
    qryTipoFundoInvest: TwwQuery;
    qryTipoFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    qryTipoFundoInvestDESCTIPOFUNDOINV: TStringField;
    qryClasseTit: TwwQuery;
    qryClasseTitIDCLASSETIT: TFloatField;
    qryClasseTitDESCCLASSETIT: TStringField;
    qryInvestimento: TwwQuery;
    qryFundoInvest: TwwQuery;
    qryFundoInvestIDFUNDOINVEST: TFloatField;
    qryFundoInvestDESCFUNDOINVEST: TStringField;
    qryDATABLOQUEIO: TDateTimeField;
    pnlPrinc: TPanel;
    Label4: TLabel;
    dblTipoInvest: TCMDBLookupCombo;
    Label8: TLabel;
    dbdDataBloq: TCMDateTimePicker;
    pnlRV: TPanel;
    Label1: TLabel;
    dblTipoInvestRV: TCMDBLookupCombo;
    Label6: TLabel;
    dblInvestimento: TCMDBLookupCombo;
    pnlRF: TPanel;
    Label5: TLabel;
    dblClasseTit: TCMDBLookupCombo;
    Label9: TLabel;
    dblInvestRF: TCMDBLookupCombo;
    pnlFundos: TPanel;
    Label3: TLabel;
    dblTipoFundoInvest: TCMDBLookupCombo;
    Label7: TLabel;
    dblFundoInvest: TCMDBLookupCombo;
    pnlBMF: TPanel;
    Label2: TLabel;
    cblTipoMercadoBMF: TCMDBLookupCombo;
    Label10: TLabel;
    dblInvestBMF: TCMDBLookupCombo;
    procedure dblTipoInvestExit(Sender: TObject);
    procedure dblTipoInvestRVExit(Sender: TObject);
    procedure dblTipoFundoInvestExit(Sender: TObject);
    procedure dblClasseTitExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblTipoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(iChave: Integer);
    procedure SelTpInv;
  public
    { Public declarations }
  end;

var
  frmCadTravasProc: TfrmCadTravasProc;

implementation

uses UmensErro, USistema, dBaseDados, UDataBase, UOperComum;
//, URendaFixa, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmCadTravasProc.dblTipoInvestExit(Sender: TObject);
begin
   inherited;
   SelTpInv;

{   if (Trim(dblTipoInvest.Text) <> '') then
   begin
      OperComum.LimpaParametros(qryTipoFundoInvest);
      OperComum.LimpaParametros(qryInvestimento);
      OperComum.LimpaParametros(qryFundoInvest);
      case qryTipoInvestIDTIPOINVEST.AsInteger of
      1: begin // RF
            qryTipoFundoInvest.Open;
            qryInvestimento.ParamByName('IDTIPOINVEST').AsInteger := 1;
            qryInvestimento.Open;
            qryFundoInvest.Open;

            dblTipoInvestRV.Clear;
            dblTipoInvestRV.Enabled := False;
            cblTipoMercadoBMF.Clear;
            cblTipoMercadoBMF.Enabled := False;
            dblTipoFundoInvest.Clear;
            dblTipoFundoInvest.Enabled := False;
            dblClasseTit.Enabled := True;
            dblInvestimento.Enabled := True;
            dblFundoInvest.Clear;
            dblFundoInvest.Enabled := False;
         end;
      2: begin //RV
            qryTipoFundoInvest.Open;
            qryInvestimento.ParamByName('IDTIPOINVEST').AsInteger := 2;
            qryInvestimento.Open;
            qryFundoinvest.Open;

            dblTipoInvestRV.Enabled := True;
            cblTipoMercadoBMF.Clear;
            cblTipoMercadoBMF.Enabled := False;
            dblTipoFundoInvest.Clear;
            dblTipoFundoInvest.Enabled := False;
            dblClasseTit.Clear;
            dblClasseTit.Enabled := False;
            dblInvestimento.Enabled := True;
            dblFundoInvest.Clear;
            dblFundoInvest.Enabled := False;
         end;
      5..7:
         begin // Fundos
            qryTipoFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := qryTipoInvestIDTIPOINVEST.AsInteger;
            qryTipoFundoInvest.Open;
            qryInvestimento.Open;
            qryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := qryTipoInvestIDTIPOINVEST.AsInteger;
            qryFundoInvest.Open;

            dblTipoInvestRV.Clear;
            dblTipoInvestRV.Enabled := False;
            cblTipoMercadoBMF.Clear;
            cblTipoMercadoBMF.Enabled := False;
            dblTipoFundoInvest.Enabled := True;
            dblClasseTit.Clear;
            dblClasseTit.Enabled := False;
            dblInvestimento.Clear;
            dblInvestimento.Enabled := False;
            dblFundoInvest.Enabled := True;
         end;
      8: begin // BM&F
            qryTipoFundoInvest.Open;
            qryInvestimento.ParamByName('IDTIPOINVEST').AsInteger := 8;
            qryInvestimento.Open;
            qryFundoInvest.Open;

            dblTipoInvestRV.Clear;
            dblTipoInvestRV.Enabled := False;
            cblTipoMercadoBMF.Clear;
            cblTipoMercadoBMF.Enabled := False;
            dblTipoFundoInvest.Clear;
            dblTipoFundoInvest.Enabled := False;
            dblClasseTit.Clear;
            dblClasseTit.Enabled := False;
            dblInvestimento.Enabled := True;
            dblFundoInvest.Clear;
            dblFundoInvest.Enabled := False;
         end;
      else
         begin
            qryTipoFundoInvest.Open;
            qryInvestimento.Open;
            qryFundoInvest.Open;

            dblTipoInvestRV.Clear;
            cblTipoMercadoBMF.Clear;
            dblTipoFundoInvest.Clear;
            dblClasseTit.Clear;
            dblInvestimento.Clear;
            dblFundoInvest.Clear;

            dblTipoInvestRV.Enabled := True;
            cblTipoMercadoBMF.Enabled := True;
            dblTipoFundoInvest.Enabled := True;
            dblClasseTit.Enabled := True;
            dblInvestimento.Enabled := True;
            dblFundoInvest.Enabled := True;
         end;
      end;
   end
   else
   begin
      dblTipoInvestRV.Clear;
      cblTipoMercadoBMF.Clear;
      dblTipoFundoInvest.Clear;
      dblClasseTit.Clear;
      dblInvestimento.Clear;
      dblFundoInvest.Clear;

      dblTipoInvestRV.Enabled := True;
      cblTipoMercadoBMF.Enabled := True;
      dblTipoFundoInvest.Enabled := True;
      dblClasseTit.Enabled := True;
      dblInvestimento.Enabled := True;
      dblFundoInvest.Enabled := True;

      qryTipoFundoInvest.Open;
      qryInvestimento.Open;
      qryFundoInvest.Open;
   end; }
end;

procedure TfrmCadTravasProc.dblTipoInvestRVExit(Sender: TObject);
begin
   inherited;
   if Trim(dblTipoInvestRV.Text) <> '' then
      dblInvestimento.Enabled := (qryTipoInvestRVIDTIPOINVESTRV.AsInteger = 1)
   else
      dblInvestimento.Enabled := True;
end;

procedure TfrmCadTravasProc.dblTipoFundoInvestExit(Sender: TObject);
begin
   inherited;
   if Trim(dblTipoFundoInvest.Text) <> '' then
   begin
      qryFundoInvest.Close;
      qryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := qryTipoFundoInvestIDTIPOFUNDOINVEST.AsInteger;
      qryFundoInvest.Open;
   end;
end;

procedure TfrmCadTravasProc.dblClasseTitExit(Sender: TObject);
begin
   inherited;
   if Trim(dblClasseTit.Text) <> '' then
   begin
      qryInvestimento.Close;
      qryInvestimento.ParamByName('IDCLASSETIT').AsInteger := qryClasseTitIDCLASSETIT.AsInteger;
      qryInvestimento.Open;
   end
   else
   begin
      qryInvestimento.Close;
      qryInvestimento.ParamByName('IDCLASSETIT').Clear;
      qryInvestimento.Open;
   end
end;

procedure TfrmCadTravasProc.FormShow(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(qryTipoInvest);
   OperComum.LimpaParametros(qryTipoInvestRV);
   OperComum.LimpaParametros(qryTipoMercadoBMF);
   OperComum.LimpaParametros(qryTipoFundoInvest);
   OperComum.LimpaParametros(qryClasseTit);
   OperComum.LimpaParametros(qryInvestimento);
   OperComum.LimpaParametros(qryFundoinvest);
   qryTipoInvest.Open;
   qryTipoInvestRV.Open;
   qryTipoMercadoBMF.Open;
   qryTipoFundoInvest.Open;
   qryClasseTit.Open;
   qryInvestimento.Open;
   qryFundoinvest.Open;
   Sel(-1);
end;

procedure TfrmCadTravasProc.Sel(iChave: Integer);
begin
   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDTRAVASPROC').AsInteger := iChave;
   qry.Open;
end;
procedure TfrmCadTravasProc.SelTpInv;
begin
   if (Trim(dblTipoInvest.Text) <> '') then
   begin
      OperComum.LimpaParametros(qryTipoFundoInvest);
      OperComum.LimpaParametros(qryInvestimento);
      OperComum.LimpaParametros(qryFundoInvest);
      case qryTipoInvestIDTIPOINVEST.AsInteger of
      1: begin // RF
            qryTipoFundoInvest.Open;
            qryInvestimento.ParamByName('IDTIPOINVEST').AsInteger := 1;
            qryInvestimento.Open;
            qryFundoInvest.Open;

            dblTipoInvestRV.Clear;
            cblTipoMercadoBMF.Clear;
            dblTipoFundoInvest.Clear;
            dblFundoInvest.Clear;

            pnlRF.BringToFront;
            pnlRF.Enabled := True;
            pnlRV.Enabled := False;
            pnlFundos.Enabled := False;
            pnlBMF.Enabled := False;
         end;
      2: begin //RV
            qryTipoFundoInvest.Open;
            qryInvestimento.ParamByName('IDTIPOINVEST').AsInteger := 2;
            qryInvestimento.Open;
            qryFundoinvest.Open;

            cblTipoMercadoBMF.Clear;
            dblTipoFundoInvest.Clear;
            dblClasseTit.Clear;
            dblFundoInvest.Clear;

            pnlRV.BringToFront;
            pnlRV.Enabled := True;
            pnlRF.Enabled := False;
            pnlFundos.Enabled := False;
            pnlBMF.Enabled := False;
         end;
      5..7:
         begin // Fundos
            qryTipoFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := qryTipoInvestIDTIPOINVEST.AsInteger;
            qryTipoFundoInvest.Open;
            qryInvestimento.Open;
            qryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := qryTipoInvestIDTIPOINVEST.AsInteger;
            qryFundoInvest.Open;

            dblTipoInvestRV.Clear;
            cblTipoMercadoBMF.Clear;
            dblClasseTit.Clear;
            dblInvestimento.Clear;

            pnlFundos.BringToFront;
            pnlFundos.Enabled := True;
            pnlBMF.Enabled := False;
            pnlRF.Enabled := False;
            pnlRV.Enabled := False;
         end;
      8: begin // BM&F
            qryTipoFundoInvest.Open;
            qryInvestimento.ParamByName('IDTIPOINVEST').AsInteger := 8;
            qryInvestimento.Open;
            qryFundoInvest.Open;

            dblTipoInvestRV.Clear;
            cblTipoMercadoBMF.Clear;
            dblTipoFundoInvest.Clear;
            dblClasseTit.Clear;
            dblFundoInvest.Clear;

            pnlBMF.BringToFront;
            pnlBMF.Enabled := True;
            pnlFundos.Enabled := False;
            pnlRF.Enabled := False;
            pnlRV.Enabled := False;
         end;
      else
         begin
            qryTipoFundoInvest.Open;
            qryInvestimento.Open;
            qryFundoInvest.Open;

            dblTipoInvestRV.Clear;
            cblTipoMercadoBMF.Clear;
            dblTipoFundoInvest.Clear;
            dblClasseTit.Clear;
            dblInvestimento.Clear;
            dblFundoInvest.Clear;

            pnlBMF.Enabled := True;
            pnlFundos.Enabled := True;
            pnlRF.Enabled := True;
            pnlRV.Enabled := True;
         end;
      end;
   end
   else
   begin
      dblTipoInvestRV.Clear;
      cblTipoMercadoBMF.Clear;
      dblTipoFundoInvest.Clear;
      dblClasseTit.Clear;
      dblInvestimento.Clear;
      dblFundoInvest.Clear;

      pnlBMF.Enabled := False;
      pnlFundos.Enabled := False;
      pnlRF.Enabled := False;
      pnlRV.Enabled := False;

      qryTipoFundoInvest.Open;
      qryInvestimento.Open;
      qryFundoInvest.Open;
   end;
end;

procedure TfrmCadTravasProc.dblTipoInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
      SelTpInv;
end;

procedure TfrmCadTravasProc.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dbdDataBloq.CanFocus then
     dbdDataBloq.SetFocus;
end;

procedure TfrmCadTravasProc.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if dbdDataBloq.CanFocus then
     dbdDataBloq.SetFocus;
end;

procedure TfrmCadTravasProc.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
   SelTpInv;
end;

procedure TfrmCadTravasProc.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := False;
   if Trim(dbdDataBloq.Text) = '' then
   begin
      MsgDlg('Favor preencher a data de bloqueio', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      Exit;
   end;
   if Trim(dblTipoInvest.Text) = '' then
   begin
      MsgDlg('Favor preencher o tipo de investimento', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      Exit;
   end;
   Accept := True;
end;

procedure TfrmCadTravasProc.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  qryIDTRAVASPROC.AsInteger := LeUltRegistro(nil, 'TRAVASPROC');
end;

procedure TfrmCadTravasProc.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;  // Cancela o Repetir Inserir
  inherited;
end;

end.
