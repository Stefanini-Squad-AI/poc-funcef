{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                            CM Soluções Informática

                                 OPERAÇÃO DE AP

Módulo       : InvestImob ( Investimentos Imobiliários )
Responsável  : Daniel Simões
Data Término : 23/01/2007

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 172902/8222
Responsável  : Wylliam Leite da Silva
Data         : 04/04/2012
Descrição    : Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecAltAp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroMtImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, wwdblook, Wwdotdot, Wwdbcomb, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlLancamentosImovel, uCtrlPadroes, uSistema, uCmSqlParams, DBCtrls, UMensErro,
  TREdit,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab;

type
  TfrmExecAltAp = class(TfrmCadastroMtImob)
    Label1: TLabel;
    dbedtDocumento: TwwDBEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbCboFormaPagamento: TwwDBLookupCombo;
    Label6: TLabel;
    dbedtReferencia: TwwDBEdit;
    Label7: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    CMDateTimePicker2: TCMDateTimePicker;
    CMSqlParams1: TCMSqlParams;
    dbmemObservacao: TDBMemo;
    sqlForma: TCMSqlParams;
    cdsForma: TCMClientDataSet;
    dbedtValor: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }

    CtrlLancImovel : TCtrlLancamentosImovel;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

  public
    { Public declarations }
  end;

var
  frmExecAltAp: TfrmExecAltAp;

implementation

{$R *.DFM}

procedure TfrmExecAltAp.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlLancImovel := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa,
                                                  Sistema.IdModulo,
                                                  Sistema.IdUsuario,
                                                  Sistema.IdEspAcesso,
                                                  Sistema.UsaPlanoPatro);

  CtrlLancImovel.InitializeAs(Padroes);
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

procedure TfrmExecAltAp.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if (MontaSelect.RetornouValor) then begin
    Cds.Data := CtrlLancImovel.LookupAlteraAP(StrToInt(MontaSelect.ValoresChave[0]));

    sqlForma.Prepare;
    sqlForma.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
    sqlForma.Open;
  end;
end;

procedure TfrmExecAltAp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlLancImovel);
  sqlForma.Free;
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  inherited;
end;

procedure TfrmExecAltAp.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  try

    // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
    if  CMDateTimePicker1.Text <> '' then
    begin
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,CMDateTimePicker1.Text) then
       begin
          CMDateTimePicker1.SetFocus;
          MsgDlg ('Período bloqueado pela Contabilidade - Data de Vencimento','Aviso',mtWarning,[mbok],0);
          bbtnCancelarClick(Sender);
          exit;
       end;
    end;

    if  CMDateTimePicker2.Text <> '' then
    begin
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,CMDateTimePicker2.Text) then
       begin
          CMDateTimePicker2.Setfocus;
          MsgDlg ('Período bloqueado pela Contabilidade - Data Programada','Aviso',mtWarning,[mbok],0);
          bbtnCancelarClick(Sender);
          exit;
       end;
    end;   
    // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

    if (CtrlLancImovel.GravaAlteracaoAP(Cds.FieldByName('CODDOCUMENTO').AsInteger,
                                        Cds.FieldByName('CODPORTFORMA').AsInteger,
                                        Cds.FieldByName('DATAVENCTO').AsDateTime,
                                        Cds.FieldByName('DATAPROGRAMADA').AsDateTime,
                                        Cds.FieldByName('REFERENCIAAP').AsString,
                                        Cds.FieldByName('OBS').AsString)) then
    begin
      MsgDlg('Alteração efetuada com sucesso!','Confirmação',mtConfirmation,[mbOk],0);
    end;
  except
    raise Exception.Create( CtrlLancImovel.MessageInfo );
  end;
end;

end.
