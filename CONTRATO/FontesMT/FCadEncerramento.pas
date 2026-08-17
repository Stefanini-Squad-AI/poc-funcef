{-------------------------------------------------------------------------------
---------------------- ALTERAÇÕES / IMPLEMENTAÇÕES -----------------------------
-------------------------------------------------------------------------------------
N.WO............: WO38245
Data............: 15/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para corrigir a identificação correta do chamador da
                  funcionalidade de encerramento.
-------------------------------------------------------------------------------------
N.WO............: WO31928
Data............: 02/02/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para atender a nova forma de indisponibilizar tudo pra tras
                  quando do lançamento de um aditamento com reinicio de parcelas. 
-------------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 09/12/2024
Responsável.....: Paulo Nobre
Descrição.......: Ajustando/compatibilizando a função AplicaAtualContratos. 
--------------------------------------------------------------------------------
N. SIG..........: 132255
Data............: 23/05/2023
Responsável.....: Marcos Lima
Descrição.......: Ajustando o max length do componente "mmoMotivo"
--------------------------------------------------------------------------------
N. SIG..........: 101877
Data............: 02/12/2020
Responsável.....: Everson Cunha
Descrição.......: Criação dos campos Tipo Serviço, Distrato e histórico alt.
--------------------------------------------------------------------------------
N. SIG..........: 61610
Data............: 24/01/2018
Responsável.....: Darivaldo Alencar
Descrição.......: Alterado a ordem de consulta do Montaselect
--------------------------------------------------------------------------------
Rotina:            Várias
Nº SOL:            120379
Nº KINTANA         575054
Data da Alteração: 29/01/2010
Responsável:       Ricardo A.
Descrição:         Criação do formulário
--------------------------------------------------------------------------------}

unit FCadEncerramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, uCtrlContratos, uCtrlServProdxItemContr,
  uCtrlAditamento;

type
  TfrmCadEncerramento = class(TFrmCadastroMT)
    lbl1: TLabel;
    dbeContrato: TDBEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dbeNumeroProcesso: TDBEdit;
    dbeServicoProduto: TDBEdit;
    dbeItem: TDBEdit;
    dtpDataEncerramento: TCMDateTimePicker;
    mmoMotivo: TDBMemo;
    cdsServicoProduto: TCMClientDataSet;
    dsServicoProduto: TDataSource;
    cdsAditamento: TCMClientDataSet;
    cdsLogAditamento: TCMClientDataSet;
    dbchkDistrato: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    // Ricardo A. SOL 120379 KTN 575054
    CtrlContratos: TCtrlContratos;
    CtrlServProdxItemContr: TCtrlServProdxItemContr;
    CtrlAditamento: TCtrlAditamento;
    // FIM Ricardo A. SOL 120379 KTN 575054
public
    { Public declarations }
  end;

var
  frmCadEncerramento: TfrmCadEncerramento;

implementation

uses
  DBaseDados, USistema;

{$R *.DFM}

procedure TfrmCadEncerramento.FormCreate(Sender: TObject);
begin
  inherited;

  // Ricardo A. SOL 120379 KTN 575054
  CtrlContratos := TCtrlContratos.Create( Sistema.IdEmpresa, Sistema.IdUsuario );
  CtrlContratos.Initialize( dtmBaseDados.dbBaseDados, True );
  CtrlContratos.CdsContratoContr := Cds;

  CtrlContratos.CdsAditamento    := cdsAditamento;
  CtrlContratos.CdsLogAditamento := cdsLogAditamento;

  CtrlAditamento := TCtrlAditamento.Create;
  CtrlAditamento.Initialize( dtmBaseDados.dbBaseDados, True );

  CtrlServProdxItemContr := TCtrlServProdxItemContr.Create;
  CtrlServProdxItemContr.Initialize( dtmBaseDados.dbBaseDados, True );

  Cds.Data := CtrlContratos.ListContratos( -1 ); //Vazio
  CdsServicoProduto.Data := CtrlServProdxItemContr.ListProdServXItem( -1, -1, -1, False ); //Vazio
  CdsAditamento.Data := CtrlAditamento.ListAditamento( -1, -1 ); //Vazio
  CdsLogAditamento.Data := CtrlAditamento.ListLogAditamento( -1 ); //Vazio
  // FIM Ricardo A. SOL 120379 KTN 575054
end;

procedure TfrmCadEncerramento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Ricardo A. SOL 120379 KTN 575054
  CtrlAditamento.Free;
  CtrlServProdxItemContr.Free;
  CtrlContratos.Free;
  // FIM Ricardo A. SOL 120379 KTN 575054
  inherited;

end;

procedure TfrmCadEncerramento.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  // Ricardo A. SOL 120379 KTN 575054
  if MontaSelect.RetornouValor then
  begin
    Cds.Data := CtrlContratos.ListContratos( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) ); //Vazio
    CdsServicoProduto.Data := CtrlServProdxItemContr.ListProdServXItem(
      StrToFloat( MontaSelect.ValoresChave[ 0 ] ),
      StrToFloat( MontaSelect.ValoresChave[ 2 ] ),
      StrToFloat( MontaSelect.ValoresChave[ 1 ] ),
      False
      );
  end;
  // FIM Ricardo A. SOL 120379 KTN 575054
end;

procedure TfrmCadEncerramento.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  // Paulo Nobre - WO15750 - Inicio
  // Ricardo A. SOL 120379 KTN 575054
//  CtrlContratos.AplicaAtualContratos(False, False, 0, 0, 0 );
  // FIM Ricardo A. SOL 120379 KTN 575054
  // Paulo Nobre - WO15750 - Fim

  // Paulo Nobre - WO38245 - Inicio
  // CtrlContratos.AplicaAtualContratos(False, 'E');    // Paulo Nobre - WO31928

  CtrlContratos.AplicaAtualContratos(False, 'AE'); // Chamado pela Alteração de Encerramento
  // Paulo Nobre - WO38245 - Fim

end;

procedure TfrmCadEncerramento.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Ricardo A. SOL 120379 KTN 575054
  Accept := False;

  if ( Cds.FieldByName( 'DATAEFETENCERRA' ).Value = 0 ) or
    ( Cds.FieldByName( 'DATAEFETENCERRA' ).IsNull ) then
  begin
    MessageDlg(  'A data de encerramento precisa ser preenchida.', mtWarning, [mbOK], 0);
    dtpDataEncerramento.SetFocus;
    Exit;
  end;

  if ( Trim( Cds.FieldByName( 'MOTIVOENCERRA' ).Value ) = '' ) or
    ( Cds.FieldByName( 'MOTIVOENCERRA' ).IsNull ) then
  begin
    MessageDlg(  'O motivo do encerramento precisa ser preenchido.', mtWarning, [mbOK], 0);
    mmoMotivo.SetFocus;
    Exit;
  end;

  Accept := True;
  // FIM Ricardo A. SOL 120379 KTN 575054
end;

procedure TfrmCadEncerramento.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 120379 KTN 575054
  dtpDataEncerramento.SetFocus;
  // FIM Ricardo A. SOL 120379 KTN 575054
end;

procedure TfrmCadEncerramento.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;

  Cds.Data := CtrlContratos.ListContratos(StrToFloat(MontaSelect.ValoresChave[0])); //Everson Cunha - SIG101877
end;

end.
