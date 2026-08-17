unit fCadFluxTitulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, uOperacaoInvest, TREdit, Mask, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, CMDBLookupCombo, CmEventosCadastro, ImgList;

type
  TfrmCadFluxTitulo = class(TfrmCadastroCS)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    dblkInvestimento: TCMDBLookupCombo;
    Investimento: TLabel;
    dbdtData: TCMDateTimePicker;
    Label1: TLabel;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    Label2: TLabel;
    dbedPIncJur: TDBRealEdit;
    dbedPPgJuros: TDBRealEdit;
    dbedPAmoJuros: TDBRealEdit;
    dbedPPUAtu: TDBRealEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBRealEdit1: TDBRealEdit;
    qryDATAFLUXO: TDateTimeField;
    qryIDINVESTIMENTO: TFloatField;
    qryPERCINCJUROS: TFloatField;
    qryPERCPGJUROS: TFloatField;
    qryPERCAMORT: TFloatField;
    qryPUATUALIZADO: TFloatField;
    qryPUINFORMADO: TFloatField;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(N : Longint;D:TDateTime);

  public
    { Public declarations }
  end;

var
  frmCadFluxTitulo: TfrmCadFluxTitulo;

implementation

{$R *.DFM}

uses uDataBase, uMensErro,UBibliotecaInvest;

procedure TfrmCadFluxTitulo.FormCreate(Sender: TObject);
begin
  inherited;
  if pRPI.IDTPPERIODICIDADE = 0 then begin
     MsgDlg('Parâmetro não definido '#13+'para Tipo de Periodicidade!','Mensagem do Sistema',MtWarning,[mbOk],0);
     Exit;
  end;
  qryInvestimento.Close;
  qryInvestimento.Params[0].Value := pRPI.IDTPPERIODICIDADE;
  qryInvestimento.Open;
  Sel(-1,StrToDate('01/01/1900'));
end;

procedure TfrmCadFluxTitulo.Sel(N : Longint;D:TDateTime);
begin
  qry.Close;
  qry.ParamByName('PDTFLUX').AsDateTime := D;
  qry.ParamByName('PIDINV').AsInteger := N;
  qry.Open;
end;

procedure TfrmCadFluxTitulo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]),StrToDate(MontaSelect.ValoresChave[1]));
end;

procedure TfrmCadFluxTitulo.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbdtData.SetFocus;
end;

procedure TfrmCadFluxTitulo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbdtData.SetFocus;
end;

procedure TfrmCadFluxTitulo.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.State in [dsEdit,dsInsert] then begin
     if Trim(dblkInvestimento.Value) = '' then begin
        MsgDlg('Investimento não preenchido','Erro',mtError,[mbOK],0);
        dblkInvestimento.SetFocus;
        end
     else if Trim(dbdtData.Text) = '' then begin
        MsgDlg('Data não preenchida','Erro',mtError,[mbOK],0);
        dbdtData.SetFocus;
        end;
  end;
  inherited;
end;

end.

