unit FParamRubricaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlParamRubrica, Mask, DBCtrls, DBCGrids, uCtrlPadroes, dBaseDados,
  uSistema, uMensErro, uCMTypes, wwdblook, DBTables, Grids, DBGrids,
  Wwdbigrd, Wwdbgrid;

type
  TFrmParamRubricaMT = class(TFrmCadastroMT)
    cdsConsulta: TCMClientDataSet;
    cdsDe: TCMClientDataSet;
    Query1: TQuery;
    plCadastro: TPanel;
    GroupBox1: TGroupBox;
    cmbCMPosBenef: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    cmbCMNegContrib: TwwDBLookupCombo;
    dsConsulta: TwwDataSource;
    cdsPara: TCMClientDataSet;
    dbgrdConsulta: TDBGrid;
    cdsRegra: TCMClientDataSet;
    GroupBox3: TGroupBox;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure cmbCMPosBenefChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlParamRubrica : TCtrlParamRubrica;

    procedure MessageCtrlParamRubrica(sMessageInfo: String);
  public
    { Public declarations }
    Procedure HabilitaBotoes;
    Function  InverteFlgDesconto(piFlgDesconto:Integer):Integer;
  end;

var
  FrmParamRubricaMT: TFrmParamRubricaMT;

implementation

{$R *.DFM}

Function TFrmParamRubricaMT.InverteFlgDesconto(piFlgDesconto:Integer):Integer;
Begin
   If piFlgDesconto = 1 Then
     Result := 0
   Else
     Result := 1;
End;

Procedure TFrmParamRubricaMT.HabilitaBotoes;
Var bHabilita:Boolean;
Begin
   bHabilita := Not cdsConsulta.IsEmpty;

   pnlFundo.Enabled    := bHabilita;
   sbtnAlterar.Enabled := bHabilita;
   sbtnApagar.Enabled  := bHabilita;
End;

procedure TFrmParamRubricaMT.MessageCtrlParamRubrica(sMessageInfo: String);
begin
  MsgDlg(sMessageInfo, 'Erro', mtError, [mbOk],0)
end;

procedure TFrmParamRubricaMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlParamRubrica := TCtrlParamRubrica.Create;
  CtrlParamRubrica.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer,
                              True, MessageCtrlParamRubrica);

  cds.Data         := CtrlParamRubrica.ListaParamRubricas(-1, -1);
  cdsConsulta.Data := CtrlParamRubrica.ListaConsulta(-1, -1);
  cdsDe.Data       := CtrlParamRubrica.ListaRubricas(-1, -1);
  cdsRegra.Data    := CtrlParamRubrica.ListaRegras;
end;

procedure TFrmParamRubricaMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  { Transfere dados do Forumlário para o Control e confirma }
  CtrlParamRubrica.CdsParamRubrica.Data := Cds.Data;
  CtrlParamRubrica.Gravar;
end;

procedure TFrmParamRubricaMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;

  dbgrdConsulta.Visible := False;

  cds.FieldByName('IDAGRUPAMENTO').AsInteger := 0;
end;

procedure TFrmParamRubricaMT.sbtnAlterarClick(Sender: TObject);
begin
  cdsDe.Locate('CODIGOINT', cdsConsulta.FieldByName('IDRUBRICADE').AsInteger,[]);
  cdsPara.Data := CtrlParamRubrica.ListaRubricas(-1, InverteFlgDesconto(cdsDe.FieldByName('FLGDESCONTO').AsInteger));

  Cds.Data := CtrlParamRubrica.ListaParamRubricas(cdsConsulta.FieldByName('IDAgrupamento').AsInteger,
                                                  cdsConsulta.FieldByName('IDParamRubrica').AsInteger);

  dbgrdConsulta.Visible := False;
  inherited;
end;

procedure TFrmParamRubricaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  cdsConsulta.Data := CtrlParamRubrica.ListaConsulta(-1, -1);
  dbgrdConsulta.Visible := True;
  HabilitaBotoes;
end;

procedure TFrmParamRubricaMT.bbtnSairClick(Sender: TObject);
begin
  dbgrdConsulta.Visible := False;
  inherited;
end;

procedure TFrmParamRubricaMT.sbtnApagarClick(Sender: TObject);
begin
  Cds.Data := CtrlParamRubrica.ListaParamRubricas(cdsConsulta.FieldByName('IDAgrupamento').AsInteger,
                                                  cdsConsulta.FieldByName('IDParamRubrica').AsInteger);

  CmeCadastro.Operacao := opIdle;

  inherited;

  HabilitaBotoes;
  cdsConsulta.Data := CtrlParamRubrica.ListaConsulta(-1, -1);
end;

procedure TFrmParamRubricaMT.cmbCMPosBenefChange(Sender: TObject);
begin
  inherited;

  cdsPara.Data := CtrlParamRubrica.ListaRubricas(-1, InverteFlgDesconto(cdsDe.FieldByName('FLGDESCONTO').AsInteger));

  cmbCMPosBenef.PerformSearch;
  cmbCMNegContrib.PerformSearch;
end;

procedure TFrmParamRubricaMT.FormShow(Sender: TObject);
begin
  inherited;
  HabilitaBotoes
end;

procedure TFrmParamRubricaMT.bbtnConfirmarClick(Sender: TObject);
Var dssStatus : TDataSetState;
begin
  dssStatus := cds.State;

  cmbCMPosBenef.PerformSearch;
  cmbCMNegContrib.PerformSearch;

  inherited;

  If dssStatus = dsEdit Then
  Begin
    HabilitaBotoes;
    cdsConsulta.Data := CtrlParamRubrica.ListaConsulta(-1, -1);
    dbgrdConsulta.Visible := True;
  End;                                                         
end;

end.























