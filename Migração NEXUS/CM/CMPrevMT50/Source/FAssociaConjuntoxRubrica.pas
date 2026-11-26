unit FAssociaConjuntoxRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient,
  uCMClientDataSet, wwdblook, Mask, DBCtrls, uCtrlConjuntoRubrica,
  dBaseDados, uMensErro, uSistema, Provider, DBTables, MontaSelect;

type
  TFrmAssociaConjuntoxRubrica = class(TfrmSairAjuda)
    Panel5: TPanel;
    lbPlanoNao: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    lblPlanPatro: TLabel;
    dbgrdPlanPatro: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    CdsProvDesc: TCMClientDataSet;
    DsProvDesc: TDataSource;
    CdsProvDescAssoc: TCMClientDataSet;
    DsProvDescAssoc: TDataSource;
    PnlFiltros: TPanel;
    Label1: TLabel;
    DbLknConjuntoRubrica: TwwDBLookupCombo;
    dbeCodigoConjunto: TDBEdit;
    Label2: TLabel;
    CdsConjuntoRubrica: TCMClientDataSet;
    DsConjuntoRubrica: TDataSource;
    Query1: TQuery;
    DataSource1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    CdsProvDescIDPROVENTO: TFloatField;
    CdsProvDescDESCRICAO: TStringField;
    CdsProvDescCODPROVDESC: TStringField;
    CdsProvDescAssocCODPROVDESC: TStringField;
    CdsProvDescAssocIDPROVENTO: TFloatField;
    CdsProvDescAssocDESCRICAO: TStringField;
    btnProcRXP: TBitBtn;
    btnProcProv: TBitBtn;
    MontaBuscaRubrica: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure DbLknConjuntoRubricaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure btnProcRXPClick(Sender: TObject);
    procedure btnProcProvClick(Sender: TObject);
  private
    { Private declarations }
    CtrlConjuntoRubrica : TCtrlConjuntoRubrica;

    procedure MessageCtrl( sMessageInfo : String);

    procedure IncluiAssociacao;
    procedure ExcluiAssociacao;

    procedure ReabreConsultas;

  public
    { Public declarations }
  end;

var
  FrmAssociaConjuntoxRubrica: TFrmAssociaConjuntoxRubrica;

implementation

{$R *.DFM}

procedure TFrmAssociaConjuntoxRubrica.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlConjuntoRubrica := TCtrlConjuntoRubrica.Create;

  CtrlConjuntoRubrica.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer,
                                 True, MessageCtrl);

  CdsConjuntoRubrica.Data := CtrlConjuntoRubrica.ListaConjuntoRubrica;

end;

procedure TFrmAssociaConjuntoxRubrica.MessageCtrl(sMessageInfo: String);
begin

  MsgDlg(sMessageInfo, 'Erro', mtError, [mbOk],0)

end;

procedure TFrmAssociaConjuntoxRubrica.DbLknConjuntoRubricaCloseUp(Sender: TObject;
                                                                  LookupTable, FillTable: TDataSet;
                                                                  modified: Boolean);
begin
  inherited;

  dbeCodigoConjunto.DataSource:=DsConjuntoRubrica;
  
  CdsProvDesc.Close;
  CdsProvDescAssoc.Close;

  If Trim( DbLknConjuntoRubrica.Text ) = '' Then Begin
    CdsProvDesc.Close;
    CdsProvDescAssoc.Close;
  End Else Begin
    CdsProvDesc.Data      := CtrlConjuntoRubrica.SelecionaRubricaNaoAssociada( StrToInt( DbLknConjuntoRubrica.LookupValue ) );
    CdsProvDescAssoc.Data := CtrlConjuntoRubrica.SelecionaRubricaAssociada   ( StrToInt( DbLknConjuntoRubrica.LookupValue ) );
  End;

end;


procedure TFrmAssociaConjuntoxRubrica.IncluiAssociacao;
begin
  CtrlConjuntoRubrica.IncluiAssociacao( CdsConjuntoRubrica.FieldByName('IDCONJUNTORUBRICA').AsInteger, CdsProvDesc.FieldByName('IDPROVENTO').AsInteger );
end;

procedure TFrmAssociaConjuntoxRubrica.ExcluiAssociacao;
begin
  CtrlConjuntoRubrica.ExcluiAssociacao( CdsConjuntoRubrica.FieldByName('IDCONJUNTORUBRICA').AsInteger, CdsProvDescAssoc.FieldByName('IDPROVENTO').AsInteger );
end;

procedure TFrmAssociaConjuntoxRubrica.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;

  ExcluiAssociacao;

  ReabreConsultas;

end;

procedure TFrmAssociaConjuntoxRubrica.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;

  CdsProvDescAssoc.DisableControls;

  CdsProvDescAssoc.First;

  While Not CdsProvDescAssoc.Eof Do Begin

    ExcluiAssociacao;

    CdsProvDescAssoc.Next;

  End;

  CdsProvDescAssoc.EnableControls;

  ReabreConsultas;

end;

procedure TFrmAssociaConjuntoxRubrica.ReabreConsultas;
begin

  CdsProvDesc.Close;
  CdsProvDescAssoc.Close;
 
  CdsProvDesc.Data      := CtrlConjuntoRubrica.SelecionaRubricaNaoAssociada( StrToInt( DbLknConjuntoRubrica.LookupValue ) );
  CdsProvDescAssoc.Data := CtrlConjuntoRubrica.SelecionaRubricaAssociada   ( StrToInt( DbLknConjuntoRubrica.LookupValue ) );

end;

procedure TFrmAssociaConjuntoxRubrica.sbtnAssociaClick(Sender: TObject);
begin
  inherited;

  IncluiAssociacao;

  ReabreConsultas;


end;

procedure TFrmAssociaConjuntoxRubrica.sbtnAssociaTodosClick(Sender: TObject);
begin
  inherited;

  CdsProvDesc.DisableControls;

  CdsProvDesc.First;

  While Not CdsProvDesc.Eof Do Begin

    IncluiAssociacao;

    CdsProvDesc.Next;

  End;

  CdsProvDesc.EnableControls;

  ReabreConsultas;


end;

procedure TFrmAssociaConjuntoxRubrica.btnProcRXPClick(Sender: TObject);
begin
  inherited;

  MontaBuscaRubrica.Executar;

  If ( CdsProvDescAssoc.Active = True ) And ( MontaBuscaRubrica.RetornouValor ) Then
    CdsProvDescAssoc.Locate('IDPROVENTO', MontaBuscaRubrica.ValoresChave[0],[]);

end;

procedure TFrmAssociaConjuntoxRubrica.btnProcProvClick(Sender: TObject);
begin
  inherited;

  MontaBuscaRubrica.Executar;

  If ( CdsProvDesc.Active = True ) And ( MontaBuscaRubrica.RetornouValor ) Then
    CdsProvDesc.Locate('IDPROVENTO', MontaBuscaRubrica.ValoresChave[0],[]);

end;

end.