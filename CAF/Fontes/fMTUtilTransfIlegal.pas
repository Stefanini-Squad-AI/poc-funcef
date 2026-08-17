unit fMTUtilTransfIlegal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  DB, Wwdatsrc, DBClient, uCMClientDataSet, MontaSelect,
  TREdit, Mask, wwdbedit, fcLabel, TB97Tlwn, uCmSqlParams,
  Grids, Wwdbigrd, Wwdbgrid, IvEMulti,
  uCtrlMovTransfBem, ComCtrls, Menus;

type
  TfrmMTUtilTransfIlegal = class(TfrmOkCancelar)
    Dock973: TDock97;
    sqlTransfIlegal: TCMSqlParams;
    dsTransfIlegal: TwwDataSource;
    cdsTransfIlegal: TCMClientDataSet;
    Toolbar971: TToolbar97;
    bbtnPesquisar: TBitBtn;
    edReturnSQL: TRichEdit;
    bbtnExecSQL: TBitBtn;
    dbgHistorico: TwwDBGrid;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnPesquisarClick(Sender: TObject);
    procedure bbtnExecSQLClick(Sender: TObject);
  private
    { Private declarations }
    Transf : TCtrlMovTransfBem;
    //------------------------------------------------------------------------------------
    procedure ListaTransfIlegal(fEmpresaProp : Extended);
  public
    { Public declarations }
  end;

var
  frmMTUtilTransfIlegal: TfrmMTUtilTransfIlegal;

implementation

{$R *.dfm}

uses uMensErro, uSistema, uCtrlPadroes ;

procedure TfrmMTUtilTransfIlegal.FormCreate(Sender: TObject);
begin
   inherited;
   Transf := TCtrlMovTransfBem.Create;
   Transf.InitializeAs(Padroes);
   ListaTransfIlegal(-9);
end;

procedure TfrmMTUtilTransfIlegal.bbtnPesquisarClick(Sender: TObject);
begin
   inherited;
   ListaTransfIlegal(Sistema.IdEmpresa);
   if Transf.MessageInfo <> '' then
      MsgDlg(Transf.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTUtilTransfIlegal.ListaTransfIlegal(fEmpresaProp : Extended);
begin
   cdsTransfIlegal.DisableControls;
   cdsTransfIlegal.Data := Transf.ListaTransfIlegal(fEmpresaProp);
   cdsTransfIlegal.IndexFieldNames := 'PLACA;CLASSEANT;CLASSEATU';
   cdsTransfIlegal.First;
   cdsTransfIlegal.EnableControls;
end;

procedure TfrmMTUtilTransfIlegal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Transf.Free;
end;

procedure TfrmMTUtilTransfIlegal.bbtnExecSQLClick(Sender: TObject);
var
   iLinha, iPos : Integer;
   sSql : String;
   bOkSQL : Boolean;
   aSql : TextFile;

begin
   inherited;
   OpenDialog1.Execute;
   AssignFile(aSql, OpenDialog1.FileName);
   Reset(aSql);
   //-------------------------------------------------------------------------------------
   iLinha := 1;
   bOKSql := True;
   while (not EOF(aSql)) and bOkSQL do
   begin
      Readln(aSql, sSql);
      //----------------------------------------------------------------------------------
      iPos := Pos(';', sSql);
      if iPos <> 0 then
         sSql[iPos] := ' ';
      //----------------------------------------------------------------------------------
      bOkSQL := Transf.ExecComandoSQL(trim(sSql));
      //----------------------------------------------------------------------------------
      edReturnSQL.Lines.Add(inttostr(iLinha) + ' - ' + Transf.MessageInfo);
      iLinha := iLinha + 1;
   end;
   CloseFile(aSql);
end;

end.
