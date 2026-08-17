//*****************************************************************************
// Atualizado:  01/12/2003 - André Tavares - pendência 14891

// Alterações:
{ ------------------------------------------------------------------------------------------------
Nº SIG......: 115265
Data........: 22/04/2021
Responsável.: Edilaine
Descrição...: Alteração nos dados de agencia não valida máscara
-------------------------------------------------------------------------------------------------}

unit fCadAgencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, CMProcura, StdCtrls,
  CheckLst, ComCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  Wwdbspin, ExtCtrls, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, Mask,
  wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn, uCmSqlParams;

type
  TfrmCadAgencia = class(TFrmPessoaMT)
    TbsDadosAgencia: TTabSheet;
    Bevel2: TBevel;
    Label2: TLabel;
    Label13: TLabel;
    DbLookupBancoAgencia: TwwDBLookupCombo;
    dbedNumAgencia: TwwDBEdit;
    CkbAtivo: TDBCheckBox;
    RgTipo: TDBRadioGroup;
    CdsBancoSubTipo: TCMClientDataSet;
    Label3: TLabel;
    CmbPracaComp: TwwDBLookupCombo;
    SQLPracaComp: TCMSqlParams;
    CdsPracaComp: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure DbLookupBancoAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    procedure SetMascaraNumAgencia;
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;
  end;

var
  frmCadAgencia: TfrmCadAgencia;

implementation

Uses uCtrlPessoaAgencia, uCtrlPessoa, uMensErro, uCMTypes, DBaseDados, uSistema,
     uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmCadAgencia.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaAgencia.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                    Sistema.AppRemoteServer,True);
  Pessoa.SubTipo := stAgencia;
  Pessoa.TipoPessoa := tpJuridica;
  Pessoa.ObrigaDocumento := (TCtrlPessoaAgencia(Pessoa).BuscaParamGlobal(sistema.IdEmpresa) = 1);
  inherited;

  {**
    O CdsBanco é do Pessoa da pasta de contas bancárias.
    O CdsBancoSubTipo é dos dados da agência e recebe o mesmo "Data" do CdsBanco
    não sendo nescessário atribuir a funcção de seleção de banco novamente.
  **}
  CdsBancoSubTipo.Data := CdsBanco.Data;
  SQLPracaComp.Open;
end;

procedure TfrmCadAgencia.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaAgencia(Pessoa).SelAgencia(rIdPessoa);

  SetMascaraNumAgencia;
end;

procedure TfrmCadAgencia.SetMascaraNumAgencia;
Begin
  If (Not CdsBancoSubTipo.IsEmpty) Then
  Begin
     CdsBancoSubTipo.Locate('IDPESSOA',CdsSubTipo.FieldByName('IDBANCO').AsInteger,[]);

     If (Not CdsBancoSubTipo.FieldByName('MASCARAAGENCIA').IsNull) Then
        CdsSubTipo.FieldByName('NUMAGENCIA').EditMask := CdsBancoSubTipo.FieldByName('MASCARAAGENCIA').AsString + ';' + MaskNoSave + '; '
     Else
        CdsSubTipo.FieldByName('NUMAGENCIA').EditMask := ParamIntegra.MascaraAgencia;
  End;
End;


procedure TfrmCadAgencia.DbLookupBancoAgenciaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SetMascaraNumAgencia;
end;

procedure TfrmCadAgencia.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
    sMascaraAg : string;                 //edilaine SIG115265
begin
  inherited;
  If Accept Then
  Begin
    Accept := Not CdsSubTipo.FieldByName('NUMAGENCIA').IsNull;

    If Not Accept Then
       MsgDlg('Nº da Agência não informada','Atenção',mtError,[mbOk],0)
    Else
    Begin
       Accept := Not CdsSubTipo.FieldByName('IDBANCO').IsNull;

       If Not Accept Then
          MsgDlg('Nº do Banco não informado','Atenção',mtError,[mbOk],0)
       Else
       Begin
          //edilaine SIG115265 : inicio
          If (Not CdsBancoSubTipo.FieldByName('MASCARAAGENCIA').IsNull) Then
             sMascaraAg := CdsBancoSubTipo.FieldByName('MASCARAAGENCIA').AsString
          Else
             sMascaraAg := ParamIntegra.MascaraAgencia;
          sMascaraAg := StringReplace( StringReplace(sMascaraAg, '-', '', []), '.', '', []);
          
          Accept := length(CdsSubTipo.FieldByName('NUMAGENCIA').AsString) = length(sMascaraAg);

          If Not Accept Then
             MsgDlg('Nº da Agência inválida','Atenção',mtError,[mbOk],0)
          else
          begin
            Accept := TCtrlPessoaAgencia(Pessoa).ValidaNumAgencia( CdsSubTipo.FieldByName('NUMAGENCIA').AsString, Cds.FieldByName('IDPESSOA').AsFloat, CdsSubTipo.FieldByName('IDBANCO').AsFloat);

            If Not Accept Then
               MsgDlg('Nº da Agência já cadastrada','Atenção',mtError,[mbOk],0);
          end;
           //edilaine SIG115265 : fim
       End;
    End;
  end;
end;

end.
