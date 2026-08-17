{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
unit FCadMoedaMT;
//==============================================================================
//Rotina......: 
//Nº SIG......: 116924
//Data........: 09/05/2022
//Responsável.: Luis Ferrari
//Descrição...: Inclusão na tela do campo MESESFATOR
//-----------------------------------------------------------------------------------------------------
//  Data      : 06/01/2006
//  Pendência : 20380
//  Descrição : Criação da opção "Quizenal" em periodicidade.
//
//==============================================================================

//==============================================================================
//  Data      : 20/01/2005
//  Pendência : 17620
//  Descrição : Permitir que moedas inativas apareçam na tela
//              para reativação, caso o usuário deseje
//
//==============================================================================

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, TREdit,
  wwdblook, ExtCtrls, DBCtrls, wwdbedit, Mask, Wwdotdot, Wwdbcomb,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, uCtrlMoeda, uCmTypes;

type
  TfrmCadMoeda = class(TFrmCadastroMT)
    lblMoeSigla: TLabel;
    lblMoeDesc: TLabel;
    lblMoePeriodicidade: TLabel;
    Label5: TLabel;
    cmbPeriodo: TwwDBComboBox;
    dbedMoeSigla: TwwDBEdit;
    dbedMoeDesc: TwwDBEdit;
    pnlMoeInativo: TPanel;
    DBCkbInativa: TDBCheckBox;
    dbRdgpTipo: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblkMoeRef: TwwDBLookupCombo;
    dbredFator: TDBRealEdit;
    dbdtIni: TCMDateTimePicker;
    dbdtFim: TCMDateTimePicker;
    DbEdTaxa: TwwDBEdit;
    CdsMoedaRef: TCMClientDataSet;
    DbCkbTestaDatas: TDBCheckBox;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    dbredMesesFator: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    Moeda: TCtrlMoeda;

    //  Início - P: 17620 - 20/01/2005
    Procedure Seleciona( IdMoeda: Double = 0; SoAtivos: Boolean = True);
    //  Fim    - P: 17620 - 20/01/2005


  public
    { Public declarations }
  end;

var
  frmCadMoeda: TfrmCadMoeda;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TfrmCadMoeda.Seleciona( IdMoeda: Double = 0; SoAtivos: Boolean = True);
begin
  Cds.Data := Moeda.ListaMoeda( IdMoeda, True, SoAtivos );
end;

procedure TfrmCadMoeda.FormCreate(Sender: TObject);
begin
  inherited;
  Moeda := TCtrlMoeda.Create;
  Moeda.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Moeda.cds := cds;
  CdsMoedaRef.Data := Moeda.ListaMoeda();
  Seleciona( -1 );
end;

procedure TfrmCadMoeda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Moeda.Free;
end;

procedure TfrmCadMoeda.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then Begin
     //  Início -  P: 17620 - 20/01/2005
     Seleciona( StrToFloat(MontaSelect.ValoresChave[0]),False );
     //  Início -  P: 17620 - 20/01/2005


     CdsMoedaRef.Data := Moeda.ListaMoeda( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
  End;
end;

procedure TfrmCadMoeda.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.FieldByName( 'IdUsuarioInclusao'{ivlm} ).AsFloat := Sistema.IdUsuario;
  Accept := Moeda.Gravar;
end;

procedure TfrmCadMoeda.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Moeda.Gravar;
end;

procedure TfrmCadMoeda.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Moeda.Gravar;
end;

procedure TfrmCadMoeda.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( Moeda.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TfrmCadMoeda.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName( 'MoePeriodicidade'{ivlm} ).AsString := 'D'{ivlm};
  Cds.FieldByName( 'MoeInativo'{ivlm} ).AsString       := 'A'{ivlm};
  Cds.FieldByName( 'FlgPercValor'{ivlm} ).AsString     := 'V'{ivlm};
  Cds.FieldByName( 'IdUsuarioInclusao'{ivlm} ).AsFloat := Sistema.IdUsuario;
  { 03/07/2003 }
  Cds.FieldByName( 'FLGTESTADATASCOT').AsString := 'S';

  dbedMoeSigla.SetFocus;
end;

procedure TfrmCadMoeda.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedMoeSigla.SetFocus;
end;

procedure TfrmCadMoeda.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
  cdsaux: TClientDataset;
begin
  inherited;
  If CmeCadastro.Operacao In [ OpInserir, OpAlterar ] Then Begin
     CdsAux := TClientDataset.Create( Self );

     If CmeCadastro.Operacao = OpInserir Then
        CdsAux.Data := Moeda.GetDataPacket( 'Select MoeCodigo From Moeda Where Upper( MoeSigla ) = '{ivlm} +
                                            QuotedStr( UpperCase( Cds.FieldByName( 'MoeSigla'{ivlm} ).AsString ) ) )
     Else
        CdsAux.Data := Moeda.GetDataPacket( 'Select MoeCodigo From Moeda Where Upper( MoeSigla ) = '{ivlm} +
                                            QuotedStr( UpperCase( Cds.FieldByName( 'MoeSigla'{ivlm} ).AsString ) ) +
                                            ' And MoeCodigo <> '{ivlm} + Cds.FieldByName( 'MoeCodigo'{ivlm} ).AsString );

     If Not CdsAux.IsEmpty Then Begin
        Moeda.MessageInfo := Translate('Existe outra Moeda cadastrada com esta sigla.');
        Accept := False;
        dbedMoeSigla.SetFocus;
     End;

     CdsAux.Close;
     CdsAux.Free;
  End;
end;

end.
