{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27582
Responsável : Daniel Simões
Data        : 12/03/2008
Descrição   : Ajuste do Help Context.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCancelaNFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, Db, DBClient, uCMClientDataSet,
  Wwdatsrc, uCtrlCancelaNF, uCmSqlParams, FSairAjuda;

type
  TfrmCancelaNFMT = class(TfrmSairAjuda)
    Panel1: TPanel;
    dbgdNotasFiscais: TwwDBGrid;
    Label1: TLabel;
    dtpDataEmissao: TCMDateTimePicker;
    Label2: TLabel;
    dbeNumNota: TDBRealEdit;
    btnSelecionar: TBitBtn;
    cdsNotasFiscais: TCMClientDataSet;
    ds: TwwDataSource;
    spTeste: TCMSqlParams;
    btnProcessar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
  private
    { Private declarations }
    iNumMarcados : Integer;
    CtrlCancelaNF : TCtrlCancelaNF;
    procedure cdsNotasFiscaisCANCELANOTAChange(Sender: TField);
  public
    { Public declarations }
  end;

var
  frmCancelaNFMT: TfrmCancelaNFMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCancelaNFMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlCancelaNF:=TCtrlCancelaNF.Create;
   CtrlCancelaNF.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlCancelaNF.CdsNotasFiscais:=cdsNotasFiscais;

   //Carrega cdsNotasFiscais
   cdsNotasFiscais.Data:=CtrlCancelaNF.ListNotasFiscais(-1,-1,0);
   iNumMarcados:=0;
end;

procedure TfrmCancelaNFMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   CtrlCancelaNF.Free;
end;

procedure TfrmCancelaNFMT.btnSelecionarClick(Sender: TObject);
begin
   cdsNotasFiscais.Close;
   cdsNotasFiscais.Data:=CtrlCancelaNF.ListNotasFiscais(Sistema.IdEmpresa,
                                                        dbeNumNota.Value,
                                                        dtpDataEmissao.Date);
   TStringField(cdsNotasFiscais.FieldByName('CANCELANOTA')).OnChange:=
                cdsNotasFiscaisCANCELANOTAChange;
end;

procedure TfrmCancelaNFMT.cdsNotasFiscaisCANCELANOTAChange(Sender: TField);
begin
   if (cdsNotasFiscais.FieldByName('CANCELANOTA').AsString='S') then
       Dec(iNumMarcados)
   else
       Inc(iNumMarcados);
   btnProcessar.Enabled:=(iNumMarcados<>0);
end;

procedure TfrmCancelaNFMT.btnProcessarClick(Sender: TObject);
begin
   if CtrlCancelaNF.AplicaCancelamentoNF then
      MsgDlg('Nota(s) Fiscai(s) Canceladas com Sucesso','Atenção',mtWarning,[mbOk],0)
   else
      MsgDlg(CtrlCancelaNF.MessageInfo,'Erro',mtError,[mbOK],0);

   cdsNotasFiscais.Close;
   cdsNotasFiscais.Data:=CtrlCancelaNF.ListNotasFiscais(Sistema.IdEmpresa,
                                                        dbeNumNota.Value,
                                                        dtpDataEmissao.Date);
   TStringField(cdsNotasFiscais.FieldByName('CANCELANOTA')).OnChange:=
                cdsNotasFiscaisCANCELANOTAChange;
end;

end.
