// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)       : Jéssica Lana Nunes dos Santos
// Data           : 05/03/2009
// Pendência      : SOL 109421 KINTANA 496332
// Descricao      : Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FReconstruirINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, StdCtrls, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn,
  fcShapeBtn, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls,
  dBaseDados, uMensErro, uSistema, Provider, DBTables,
  ExtCtrls, MontaSelect, uCtrlBenefBfciario, uCtrlMotivo, uCtrlMoeda,
  uCtrlPadroes, wwdblook, Db, DBClient, uCMClientDataSet, Grids, DBGrids, FileCtrl;

type
  TFrmReconstruirINSS = class(TfrmWizardMT)
    PnlDados: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    bbtnProcurar: TBitBtn;
    lblParticipante: TStaticText;
    lblPatro: TStaticText;
    lblPlano: TStaticText;
    lblNUmProc: TStaticText;
    lblDIB: TStaticText;
    lblBeneficio: TStaticText;
    lblBeneficiario: TStaticText;
    lblMatricula: TStaticText;
    lblSituacaoAtual: TStaticText;
    MontaSelect: TMontaSelect;
    lblDIP: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    lblValorAtual: TStaticText;
    Bevel1: TBevel;
    lblValorTotal: TStaticText;
    Label5: TLabel;
    Label6: TLabel;
    CdsMotivo: TCMClientDataSet;
    Query: TQuery;
    DataSource: TDataSource;
    DataSetProvider: TDataSetProvider;
    DbLkcMotivo: TwwDBLookupCombo;
    TbProcessamento: TTabSheet;
    DBGrid1: TDBGrid;
    CdsAux: TCMClientDataSet;
    Label7: TLabel;
    DbLkcMoeda: TwwDBLookupCombo;
    CdsMoeda: TCMClientDataSet;
    fcLabel2: TfcLabel;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure PagControleChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    Procedure Progresso(vParam: array of Variant);

  private
    { Private declarations }

    CtrlBenefBfCiario : TCtrlBenefBfciario;
    CtrlMotivo        : TCtrlMotivo;
    CtrlMoeda         : TCtrlMoeda;

    FDadosBeneficio : Record
                        IdPessJur,
                        IdPlanoPrev,
                        IdTitular,
                        IdPessoa,
                        NumeroProcesso,
                        IdBeneficio,
                        IdPlanoOrigem,
                        SeqProposta : Integer;
                      End;

    Procedure MessageCtrl( sMessageInfo : String);

    Function  ProcessaReconstrucao: Boolean;

  public
    { Public declarations }

  end;

var
  FrmReconstruirINSS: TFrmReconstruirINSS;

implementation

uses FProgresso;

{$R *.DFM}

procedure TFrmReconstruirINSS.bbtnProcurarClick(Sender: TObject);
begin

  Inherited;

  MontaSelect.Executar;

  If MontaSelect.RetornouValor Then
  Begin

    lblMatricula.Caption    := MontaSelect.ValoresChave[15];
    lblNumProc.Caption      := MontaSelect.ValoresChave[23];
    lblParticipante.Caption := MontaSelect.ValoresChave[5];
    lblBeneficiario.Caption := MontaSelect.ValoresChave[22];
    lblPatro.Caption        := MontaSelect.ValoresChave[12];
    lblDIB.Caption          := MontaSelect.ValoresChave[11];
    lblBeneficio.Caption    := MontaSelect.ValoresChave[6];
    lblPlano.Caption        := MontaSelect.ValoresChave[13];

    lblDIP.Caption          := MontaSelect.ValoresChave[20];
    lblValorAtual.Caption   := MontaSelect.ValoresChave[26];
    lblValorTotal.Caption   := MontaSelect.ValoresChave[27];

    FDadosBeneficio.IdPessJur      := StrToInt( MontaSelect.ValoresChave[03] );
    FDadosBeneficio.IdPlanoPrev    := StrToInt( MontaSelect.ValoresChave[04] );
    FDadosBeneficio.IdTitular      := StrToInt( MontaSelect.ValoresChave[00] );
    FDadosBeneficio.IdPessoa       := StrToInt( MontaSelect.ValoresChave[21] );
    FDadosBeneficio.NumeroProcesso := StrToInt( MontaSelect.ValoresChave[23] );
    FDadosBeneficio.IdBeneficio    := StrToInt( MontaSelect.ValoresChave[19] );
    FDadosBeneficio.IdPlanoOrigem  := StrToInt( MontaSelect.ValoresChave[25] );
    FDadosBeneficio.SeqProposta    := StrToInt( MontaSelect.ValoresChave[02] );

  End;

end;

procedure TFrmReconstruirINSS.PagControleChange(Sender: TObject);
begin
  inherited;

  If ( PagControle.ActivePage = TabSheet1 ) Then
  Begin

    DbLkcMoeda.SetFocus;

  End
  Else If ( PagControle.ActivePage = TbProcessamento ) Then
  Begin

  End;

end;

procedure TFrmReconstruirINSS.MessageCtrl(sMessageInfo: String);
begin

  MsgDlg(sMessageInfo, 'Erro', mtError, [mbOk],0)

end;

Function TFrmReconstruirINSS.ProcessaReconstrucao;
Begin

  Try
    //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
    //DeleteFile( 'C:\TEMP\RETROINSS.CDS' );
    DeleteFile( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\RETROINSS.CDS');

    CtrlBenefBfCiario := TCtrlBenefBfciario.Create;

    CtrlBenefBfCiario.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                  Sistema.ConnectionSide,   Sistema.AppRemoteServer,
                                  True, MessageCtrl );

    CtrlBenefBfCiario.DbBenefBfciario.Clear;

    CtrlBenefBfCiario.DbBenefBfciario.IdPessJur.AsInteger      := FDadosBeneficio.IdPessJur;
    CtrlBenefBfCiario.DbBenefBfciario.IdPlanoPrev.AsInteger    := FDadosBeneficio.IdPlanoPrev;
    CtrlBenefBfCiario.DbBenefBfciario.IdTitular.AsInteger      := FDadosBeneficio.IdTitular;
    CtrlBenefBfCiario.DbBenefBfciario.IdPessoa.AsInteger       := FDadosBeneficio.IdPessoa;
    CtrlBenefBfCiario.DbBenefBfciario.NumeroProcesso.AsInteger := FDadosBeneficio.NumeroProcesso;
    CtrlBenefBfCiario.DbBenefBfciario.IdBeneficio.AsInteger    := FDadosBeneficio.IdBeneficio;
    CtrlBenefBfCiario.DbBenefBfciario.IdPlanoOrigem.AsInteger  := FDadosBeneficio.IdPlanoOrigem;
    CtrlBenefBfCiario.DbBenefBfciario.Seqproposta.AsInteger    := FDadosBeneficio.Seqproposta;

    CtrlBenefBfCiario.ReatroageBeneficioINSS( StrToInt( DbLkcMoeda.LookUpValue ),
                                              StrToInt( DbLkcMotivo.LookUpValue ) );

  Finally

    //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
    //If ( FileExists( 'C:\TEMP\RETROINSS.CDS' ) )
    If ( FileExists( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\RETROINSS.CDS' ) )
    //Then CdsAux.LoadFromFile('C:\TEMP\RETROINSS.CDS')
    Then CdsAux.LoadFromFile( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\RETROINSS.CDS')

    Else MsgDlg( 'Não existem meses sem lançamento no histórico desse beneficio .', 'Mensagem', mtInformation, [mbOk], 0 );;


    FreeAndNil( CtrlBenefBfCiario );

  End;

End; { ProcessaReconstrucao }

procedure TFrmReconstruirINSS.FormCreate(Sender: TObject);
Var
Dir : String;
begin
  inherited;
  //ínicio Ádler
  Dir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TEMP';

  if not DirectoryExists(Dir) then
  ForceDirectories(Dir);
  //Fim

  CtrlMotivo := TCtrlMotivo.Create;

  CtrlMotivo.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                         Sistema.ConnectionSide,   Sistema.AppRemoteServer,
                         True, MessageCtrl );

  CtrlMoeda  := TCtrlMoeda.Create;

  CtrlMoeda.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide,   Sistema.AppRemoteServer,
                        True, MessageCtrl );

end;

procedure TFrmReconstruirINSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FreeAndNil( CtrlMotivo );
  FreeAndNil( CtrlMoeda );

  inherited;

end;

procedure TFrmReconstruirINSS.FormShow(Sender: TObject);
begin
  inherited;

  CdsMotivo.Close;
  CdsMotivo.Data := CtrlMotivo.ListaMotivo;

  CdsMoeda.Close;
  CdsMoeda.Data := CtrlMoeda.ListaMoeda( 0, False, True ); 

end;

procedure TFrmReconstruirINSS.btnContinuarClick(Sender: TObject);
begin

  If ( PagControle.ActivePage = TabSheet1 ) Then
  Begin

    { Validação dos dados da tela }
    If ( Trim( DbLkcMoeda.Text ) = '' ) Then Begin

      MsgDlg( 'Informar moeda é obrigatório.', 'Erro', mtError, [mbOk], 0 );
      DbLkcMoeda.SetFocus;
      Exit;

    End;

    If ( Trim( DbLkcMotivo.Text ) = '' ) Then Begin

      MsgDlg( 'Informar motivo é obrigatório.', 'Erro', mtError, [mbOk], 0 );
      DbLkcMotivo.SetFocus;
      Exit;

    End;

    { Processar }
    ProcessaReconstrucao;
    
  End
  Else If ( PagControle.ActivePage = TbProcessamento ) Then
  Begin


  End;

  inherited;

end;

procedure TFrmReconstruirINSS.Progresso(vParam: array of Variant);
begin
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)
//   vParam[2] :  Mínimo de Registros
//   vParam[3] :  Total de Registros
//   vParam[4] :  Registro Atual
//   vParam[5] :  mensagem
//   vParam[6] :  0 = ERRO, 1 = Ok

   case vParam[1] of

      // -------------------------------------------------------------------------------------------

      0: frmProgresso.MostraFormProgresso(vParam[5],  // Legenda
                                          False,      // Botão Visivel
                                          False,      // Botão Habilitado
                                          True,       // Barra Visível
                                          vParam[2],  // Mínimo
                                          vParam[3]   // Máximo
                                         );

      // -------------------------------------------------------------------------------------------

      1:
      begin
        frmProgresso.AndaFormProgresso(vParam[4]);
      end;

      // -------------------------------------------------------------------------------------------

      2: frmProgresso.EscondeFormProgresso;

      // -------------------------------------------------------------------------------------------
   end;

   Application.ProcessMessages;
   Repaint;
end;



end.