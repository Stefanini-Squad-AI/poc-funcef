{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Folha Pag Bradesco }
{   BRADESCO FOLHA DE PAGAMENTO                         }
{   IDMODELOSCNAB = 3/P                                 }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FParamFolhaPagBradescoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, TEdNum,
  TREdit, Db, DBTables, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmParamFolhaPagBradescoMT = class(TForm)
    pnlFundo: TPanel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    EdtDataDebito: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    EdtRazao: TRealEdit;
    RgStatus: TRadioGroup;
    Label3: TLabel;
    EdtNumEmpresaBanco: TRealEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamFolhaPagBradescoMT: TFrmParamFolhaPagBradescoMT;

implementation

Uses uString, uIntBancoManager, uCmDialogs;

{$R *.DFM}

procedure TFrmParamFolhaPagBradescoMT.bbtnConfirmarClick(Sender: TObject);
begin
   With IntBancoManager Do
   Begin
     If (EdtRazao.Value = 0) Then
     Begin
        MsgAviso('Favor Indicar o Nº do Razão da Conta Corrente da Empresa','Atenção');
        EdtRazao.SetFocus;
        Exit;
     End;

     If (EdtNumEmpresaBanco.Value = 0) Then
     Begin
        MsgAviso('Favor Indicar o Nº da Empresa no Banco','Atenção');
        EdtNumEmpresaBanco.SetFocus;
        Exit;
     End;

     GravaParamIntBanco(['DATADODEBITO',
                                    'STATUSREMESSA',
                                    'NUMEMPRESABANCO',
                                    'NUMRAZAOCC'],
                                    [EdtDataDebito.Text,
                                    IntToStr(RgStatus.ItemIndex),
                                    Trim(EdtNumEmpresaBanco.Text),
                                    Trim(EdtRazao.Text)]);

     If ((EdtNumEmpresaBanco.Value <> 0) Or (IntBancoManager.CdsAux.FieldByName('NUMEMPRESABANCO').IsNull)) then
     begin
        if (Not IntBancoManager.ExecSQL('UPDATE PORTADORFORMA SET NUMEMPRESABANCO = ''' + Trim(EdtNumEmpresaBanco.Text) + ''' WHERE CODPORTFORMA = ' + IntToStr(CodigoPortadorForma))) Then
          Raise Exception.Create(IntBancoManager.MessageInfo);
     End;
   End;
   
   ModalResult := MrOk;   
end;

procedure TFrmParamFolhaPagBradescoMT.FormCreate(Sender: TObject);
begin
   IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket('SELECT NUMRAZAOCC, NUMEMPRESABANCO  FROM PORTADORFORMA WHERE CODPORTFORMA = ' + IntToStr(IntBancoManager.CodigoPortadorForma));

   if not IntBancoManager.CdsAux.IsEmpty then
   Begin
      If (Trim(IntBancoManager.CdsAux.FieldByName('NUMEMPRESABANCO').AsString) = '') Then
         EdtNumEmpresaBanco.Text := '0'
      Else
         EdtNumEmpresaBanco.Text := IntBancoManager.CdsAux.FieldByName('NUMEMPRESABANCO').AsString;

      If IntBancoManager.CdsAux.FieldByName('NumRazaoCC').IsNull Then
         EdtRazao.Text := '07050'
      Else
         EdtRazao.Text := IntBancoManager.CdsAux.FieldByName('NumRazaoCC').AsString;
   End;

   EdtDataDebito.Text      := IntBancoManager.BuscaParamIntBanco('DATADODEBITO','D');
   RgStatus.ItemIndex      := StrToInt(IntBancoManager.BuscaParamIntBanco('STATUSREMESSA','N'));
   EdtNumEmpresaBanco.Text := IntBancoManager.BuscaParamIntBanco('NUMEMPRESABANCO','N');
   EdtRazao.Text           := IntBancoManager.BuscaParamIntBanco('NUMRAZAOCC','N');
end;

end.
