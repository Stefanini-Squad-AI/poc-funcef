{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Pag Forne Bradesco }
{   BRADESCO PAGTO FORNECEDORES                         }
{   IDMODELOSCNAB = 4/P                                 }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FParamPagForneBradescoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  TREdit, ExtCtrls, Db, DBTables;

type
  TFrmParamPagForneBradescoMT = class(TForm)
    pnlFundo: TPanel;
    Label3: TLabel;
    RgStatus: TRadioGroup;
    EdtNumEmpresaBanco: TRealEdit;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    EdtCheque: TEdit;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamPagForneBradescoMT: TFrmParamPagForneBradescoMT;

implementation

Uses uString, uCmDialogs, uIntBancoManager;

{$R *.DFM}

procedure TFrmParamPagForneBradescoMT.bbtnConfirmarClick(Sender: TObject);
begin
  If (EdtNumEmpresaBanco.Value = 0) Then
  Begin
     MsgAviso('Favor Indicar o Nº da Empresa no Banco','Atenção');
     EdtNumEmpresaBanco.SetFocus;
     Exit;
  End;


  IntBancoManager.GravaParamIntBanco(['TIPODEDOCUMENTO',
                                 'INSTRUCOES',
                                 'NUMEMPRESABANCO'],
                                 [RgStatus.Items[RgStatus.ItemIndex],
                                 EdtCheque.Text,
                                 Trim(EdtNumEmpresaBanco.Text)]);

  If ((EdtNumEmpresaBanco.Value <> 0) Or (IntBancoManager.CdsAux.FieldByName('NUMEMPRESABANCO').IsNull)) then
  begin
     if (Not IntBancoManager.ExecSQL('UPDATE PORTADORFORMA SET NUMEMPRESABANCO = ''' + Trim(EdtNumEmpresaBanco.Text) + ''' WHERE CODPORTFORMA = ' + IntToStr(IntBancoManager.CodigoPortadorForma))) Then
        raise Exception.Create(IntBancoManager.MessageInfo);
  End;

  ModalResult := MrOk;
end;

procedure TFrmParamPagForneBradescoMT.FormCreate(Sender: TObject);
begin
   IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket('SELECT NUMEMPRESABANCO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + IntToStr(IntBancoManager.CodigoPortadorForma));

   if not IntBancoManager.CdsAux.IsEmpty Then
   Begin
      If (Trim(IntBancoManager.CdsAux.FieldByName('NUMEMPRESABANCO').AsString) = '') Then
         EdtNumEmpresaBanco.Text := '0'
      Else
         EdtNumEmpresaBanco.Text := IntBancoManager.CdsAux.FieldByName('NUMEMPRESABANCO').AsString;
   End;


  RgStatus.ItemIndex      := RgStatus.Items.IndexOf(IntBancoManager.BuscaParamIntBanco('TIPODEDOCUMENTO','S'));
  EdtCheque.Text          := IntBancoManager.BuscaParamIntBanco('INSTRUCOES','S');
  EdtNumEmpresaBanco.Text := IntBancoManager.BuscaParamIntBanco('NUMEMPRESABANCO','N');

  If RgStatus.ItemIndex = -1 Then RgStatus.ItemIndex := 0; 
end;

end.
