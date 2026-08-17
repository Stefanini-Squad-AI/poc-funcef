{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Pag Banco Brasil   }
{   BANCO DO BRASIL                                     }
{   IDMODELOSCNAB = 5/P                                 }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                13/08/2002                             }
{                                                       }
{*******************************************************}

unit FParamPagBBMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, TREdit, ExtCtrls,
  Db, DBTables, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamPagBBMT = class(TForm)
    pnlFundo: TPanel;
    Label1: TLabel;
    EdtDataDebito: TCMDateTimePicker;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    RgConf: TRadioGroup;
    Label2: TLabel;
    EdtMens: TEdit;
    Label3: TLabel;
    EdtRazao: TRealEdit;
    CmbServ: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    cbxFormaPagto: TComboBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamPagBBMT: TFrmParamPagBBMT;

implementation

Uses uString, uIntBancoManager, uCmDialogs;

{$R *.DFM}

procedure TFrmParamPagBBMT.bbtnConfirmarClick(Sender: TObject);
begin
  If CmbServ.ItemIndex = -1 Then
  Begin
    MsgAviso('Favor Indicar o Código do Serviço','Atenção');
    CmbServ.SetFocus;
    Exit;
  End;

  If EdtRazao.Value = 0 Then
  Begin
    MsgAviso('Favor Indicar o Número do Convênio Com o Banco','Atenção');
    EdtRazao.SetFocus;
    Exit;
  End;

  IntBancoManager.GravaParamIntBanco(['DATADODEBITO',
                                 'CODIGODOSERVICO',
                                 'INDICACOESCONFERENCIA',
                                 'TIPODERETORNO',
                                 'MENSAGEMPADRAO',
                                 'NUMCONVENIO'],
                                 [EdtDataDebito.Text,
                                 CmbServ.Text,
                                 IntToStr(RgConf.ItemIndex), //RgConf.Items[RgConf.ItemIndex],
                                 cbxFormaPagto.Text,
                                 EdtMens.Text,
                                 Trim(EdtRazao.Text)]);
  If ((EdtRazao.Value <> 0) Or (IntBancoManager.CdsAux.FieldByName('NUMEMPRESABANCO').IsNull)) then
  begin
     if (Not IntBancoManager.ExecSQL('UPDATE PORTADORFORMA SET NUMEMPRESABANCO = ''' + Trim(EdtRazao.Text) + ''' WHERE CODPORTFORMA = ' + IntToStr(IntBancoManager.CodigoPortadorForma))) Then
        Raise Exception.Create(IntBancoManager.MessageInfo);
  End;

  ModalResult := MrOk;
end;

procedure TFrmParamPagBBMT.FormCreate(Sender: TObject);
begin
   CmbServ.ItemIndex := 0;
   EdtDataDebito.Date := Date;
   IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket('SELECT NUMEMPRESABANCO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + IntToStr(IntBancoManager.CodigoPortadorForma));
   
   If not IntBancoManager.CdsAux.IsEmpty Then
   Begin
      If (Trim(IntBancoManager.CdsAux.FieldByName('NUMEMPRESABANCO').AsString) = '') Then
         EdtRazao.Text := '0'
      Else
         EdtRazao.Text := IntBancoManager.CdsAux.FieldByName('NUMEMPRESABANCO').AsString;
   End;

  EdtDataDebito.Text  := IntBancoManager.BuscaParamIntBanco('DATADODEBITO','D');
  CmbServ.ItemIndex   := CmbServ.Items.IndexOf(IntBancoManager.BuscaParamIntBanco('CODIGODOSERVICO','S'));
  cbxFormaPagto.ItemIndex := cbxFormaPagto.Items.IndexOf(IntBancoManager.BuscaParamIntBanco('TIPODERETORNO','S'));

  try
    RgConf.ItemIndex    := StrToInt(IntBancoManager.BuscaParamIntBanco('INDICACOESCONFERENCIA','S'));
  except
    RgConf.ItemIndex    := 0;
  end;
  //  RgConf.ItemIndex    := RgConf.Items.IndexOf(Biblioteca.BuscaParamIntBanco('INDICACOESCONFERENCIA','S'));
  EdtMens.Text        := IntBancoManager.BuscaParamIntBanco('MENSAGEMPADRAO','S');
  EdtRazao.Text       := IntBancoManager.BuscaParamIntBanco('NUMCONVENIO','N');

  If cbxFormaPagto.ItemIndex = -1 Then  cbxFormaPagto.ItemIndex := 0;
  If CmbServ.ItemIndex       = -1 Then  CmbServ.ItemIndex       := 0;
  If RgConf.ItemIndex        = -1 Then  RgConf.ItemIndex        := 0;
end;

end.


