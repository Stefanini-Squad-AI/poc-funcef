// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 08/10/2007
// Pendencia   : 26404
// Rotina      : Tela
// Alteração   : Retirado dados de TipoCliente e Ramo
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/06/2006
// Pendencia   : 22064
// Rotina      : tbsPath
// Alteração   : Criação de rotina para aceitar apenas a pasta parametrizada nos
//               parametros do sistema.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 08.10.2003
// Pendência   : 14952
// Alteração   : Criação do parametro FLGLAYOUTRECEB para indicar se a fundacao
//               utilizará um lay-out por patro ou mais de um, que significa utilizar
//               o cadastro antigo ou o novo 
//------------------------------------------------------------------------------
// Alteração   : Inserindo um parâmetro para agrupar na maior Parcela de
// Autor(a)    : Gleyber
// Data        : 26/09/2003
// Pendência   : 14841
// Alteração   : Inserindo um parâmetro para agrupar na maior Parcela de
//               empréstimo
//               Como não sei a utilização da UCCP, a funcionalidade chamada
//               LEPARAM foi incorporada a funcionalidade com o mesmo nome na
//               unit UAdmPrev
//------------------------------------------------------------------------------
unit FParamCCP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ComCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, DBCtrls, wwdblook, TB97Tlbr, Mask, wwdbedit,
  MontaSelect, IvDictio, IvMulti, IvEMulti, BfDialogs, BrowseFolder,
  uProcuraDir;

type
  TfrmParamCCP = class(TfrmOkCancelar)
    pgctrlParam: TPageControl;
    tbsGeral: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ds: TwwDataSource;
    chkPrevObrigaEnvio: TDBCheckBox;
    chkAssistObrigaEnvio: TDBCheckBox;
    chkEmprestObrigaEnvio: TDBCheckBox;
    qryramo: TwwQuery;
    qrytipocliente: TwwQuery;
    tbsOperacional: TTabSheet;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    dbedTamFaixa: TwwDBEdit;
    qryParam: TwwQuery;
    msBuscaRubrica: TMontaSelect;
    grbEmprestimo: TGroupBox;
    dbcAgrupar: TDBCheckBox;
    upd: TUpdateSQL;
    TabSheet1: TTabSheet;
    dbrgrpLayOutReceb: TDBRadioGroup;
    tbsPath: TTabSheet;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    btnPathRec: TBitBtn;
    dbPathRec: TwwDBEdit;
    pdlPath: TProcuraDirDlg;
    Label5: TLabel;
    dbPathEnv: TwwDBEdit;
    Label6: TLabel;
    btnPathEnv: TBitBtn;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPathRecClick(Sender: TObject);
    procedure btnPathEnvClick(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCCP: TfrmParamCCP;

implementation

uses USistema, UCCP, DBaseDados , UDataBase, UMensErro;

{$R *.DFM}

procedure TfrmParamCCP.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if chkPrevObrigaEnvio.Checked
  then bPrevObrigaEnvio := True
  else bPrevObrigaEnvio := False;

  if chkAssistObrigaEnvio.Checked
  then bAssistObrigaEnvio := True
  else bAssistObrigaEnvio := False;

  if chkEmprestObrigaEnvio.Checked
  then bEmprestObrigaEnvio := True
  else bEmprestObrigaEnvio := False;

  if dbcAgrupar.Checked
  then prmbAgrupaMaiorParcela := True
  else prmbAgrupaMaiorParcela := False;

  if dbrgrpLayOutReceb.ItemIndex = 0 
  then prmLayOutMultiploRecebimento := False
  else prmLayOutMultiploRecebimento := True;

  if qryparam.state in [dsinsert, dsedit] then
  begin
     qryParam.Post;
     qryParam.ApplyUpdates;
     qryParam.Close;
  end;

  LeParamINTERFACE('BaseDados');
  Close;
end;

procedure TfrmParamCCP.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryParam.Cancel;
  qryParam.CancelUpdates;
  qryParam.Close;
  qryramo.close;
  qrytipocliente.close;
  Close;
end;

procedure TfrmParamCCP.FormCreate(Sender: TObject);
begin
  qryramo.open;
  qrytipocliente.open;

  qryParam.Close;
  qryParam.SQL.Clear;
  qryParam.SQL.Add('SELECT FLGPREVOBRIGAENV, FLGASSISTOBRIGAE, '+
                   ' FLGEMPRESTOBRIGA, TAMFAIXA, FLGAGRUPPARCEMP, FLGLAYOUTRECEB, '+ 
                   ' PATHAUTORREC, PATHAUTORENV '+ 
                   ' FROM PARAMCCP   ');
  qryParam.Open;
  inherited;
  if Sistema.SuperUsuario
  then tbsOperacional.TabVisible := True
  else tbsOperacional.TabVisible := False;
  qryParam.Edit;
end;

procedure TfrmParamCCP.FormShow(Sender: TObject);
begin
  inherited;
  pgctrlParam.ActivePage := tbsGeral;
end;

procedure TfrmParamCCP.btnPathRecClick(Sender: TObject);
begin
  inherited;
  If Not pdlPath.Execute
   Then Exit;

  If CriticaPath(pdlPath.Directory)
   Then Begin
     MsgDlg('O local escolhido possui caracteres inválidos.'+#13+
            'Por favor, mude a localização para outra pasta.','Aviso',mtWarning,[mbOk],0);
     Exit;
   End;

  dbPathRec.Field.AsString := pdlPath.Directory;
end;

procedure TfrmParamCCP.btnPathEnvClick(Sender: TObject);
begin
  inherited;
  If Not pdlPath.Execute
   Then Exit;

  If CriticaPath(pdlPath.Directory)
   Then Begin
     MsgDlg('O local escolhido possui caracteres inválidos.'+#13+
            'Por favor, mude a localização para outra pasta.','Aviso',mtWarning,[mbOk],0);
     Exit;
   End;

  dbPathEnv.Field.AsString := pdlPath.Directory;
end;

end.
