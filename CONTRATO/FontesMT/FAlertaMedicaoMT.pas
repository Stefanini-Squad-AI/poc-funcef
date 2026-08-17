{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Sol..........: 218909/16724 
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação da funcionalidade.
--------------------------------------------------------------------------------}

unit FAlertaMedicaoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient,
  uCMClientDataSet, uCtrlCtrlParcelaMedicao, uCtrlPadroes, Wwdatsrc, FTelaAut;

type
  TfrmAlertaMedicaoMT = class(TfrmSairAjuda)
    dbgrdAlertaMedicao: TwwDBGrid;
    cdsAlertaMedicao: TCMClientDataSet;
    cds: TCMClientDataSet;
    ds: TwwDataSource;
    btnMedirContrato: TBitBtn;
    CdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdAlertaMedicaoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btnMedirContratoClick(Sender: TObject);
  private

    CtrlCtrlParcelaMedicao : TCtrlCtrlParcelaMedicao;

    { Private declarations }
  public
    { Public declarations }
    procedure InserirContratoEmAlertaNoCds;
  end;

var
  frmAlertaMedicaoMT: TfrmAlertaMedicaoMT;

implementation

uses FMedicaoContratosMT;

{$R *.DFM}

procedure TfrmAlertaMedicaoMT.FormCreate(Sender: TObject);
begin
  inherited;
  HelpContext := 230053;

  CtrlCtrlParcelaMedicao := TCtrlCtrlParcelaMedicao.Create;
  CtrlCtrlParcelaMedicao.InitializeAs(Padroes);
  CtrlCtrlParcelaMedicao.CdsAlerta := cds;

  cds.Data := CtrlCtrlParcelaMedicao.CamposAlertaMedicao;

  InserirContratoEmAlertaNoCds;
end;

procedure TfrmAlertaMedicaoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlCtrlParcelaMedicao);
end;

procedure TfrmAlertaMedicaoMT.dbgrdAlertaMedicaoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (Date > cds.FieldByName('VENCIMENTO').AsDateTime) then
     dbgrdAlertaMedicao.Canvas.Font.Color := clRed;
end;

procedure TfrmAlertaMedicaoMT.btnMedirContratoClick(Sender: TObject);
begin
  inherited;
    // chama a funcionalidade Operações -> medição, carregando alguns dados na mesma
  try
    CdsAux.Data := CtrlCtrlParcelaMedicao.GetDadosProximaParcela(cds.FieldByName('IDCONTRATO').AsInteger,
                                                                cds.FieldByName('IDITEM').AsInteger
                                                                cds.FieldByName('IDOBJETO').AsInteger);

    frmMedicaoContratosMT := TfrmMedicaoContratosMT.Create(Self);
    frmMedicaoContratosMT.IdContratoAlerta := cds.FieldByName('IDCONTRATO').AsInteger;
    frmMedicaoContratosMT.IdObjeto := cds.FieldByName('IDOBJETO').AsInteger;
    frmMedicaoContratosMT.IdItem := cds.FieldByName('IDITEM').AsInteger;
    frmMedicaoContratosMT.ParcelaNum := CdsAux.FieldByName('PARCELANUM').AsInteger;
    frmMedicaoContratosMT.IdParcMedicao := CdsAux.FieldByName('IDPARCMEDICAO').AsInteger;
    frmMedicaoContratosMT.Vencimento := CdsAux.FieldByName('VENCIMENTO').AsDateTime;
    frmMedicaoContratosMT.IdAditamento := CdsAux.FieldByName('IDADITAMENTO').AsInteger;
    frmMedicaoContratosMT.bbtnConfirmar.ModalResult := mrNone;
    frmMedicaoContratosMT.bbtnCancelar.ModalResult := mrNone;
    frmMedicaoContratosMT.VeioDoAlerta := True;
    frmMedicaoContratosMT.FormStyle := fsNormal;
    frmMedicaoContratosMT.Visible := False;
    frmMedicaoContratosMT.ShowModal;
  finally
     CdsAux.EmptyDataSet;
     FreeAndNil(frmMedicaoContratosMT);
  end;

  InserirContratoEmAlertaNoCds;
end;

procedure TfrmAlertaMedicaoMT.InserirContratoEmAlertaNoCds;
begin
  cds.EmptyDataSet;
  cdsAlertaMedicao.Data := CtrlCtrlParcelaMedicao.ListContratosParaMedicao;
  cdsAlertaMedicao.First;
  while not (cdsAlertaMedicao.Eof) do
  begin
     if (CtrlCtrlParcelaMedicao.ExibeAlerta(cdsAlertaMedicao.FieldByName('AVISOMEDICAO').AsInteger,
                                            cdsAlertaMedicao.FieldByName('VENCIMENTO').AsDateTime)) then
     begin
        cds.Insert;
        cds.FieldByName('NOMECONTRATO').AsString := cdsAlertaMedicao.FieldByName('NOMECONTRATO').AsString;
        cds.FieldByName('VENCIMENTO').AsString := cdsAlertaMedicao.FieldByName('VENCIMENTO').AsString;
        cds.FieldByName('AVISOMEDICAO').AsInteger := cdsAlertaMedicao.FieldByName('AVISOMEDICAO').AsInteger;
        cds.FieldByName('DIASENCERRAMENTO').AsInteger := CtrlCtrlParcelaMedicao.GetDiasEncerramento(cdsAlertaMedicao.FieldByName('VENCIMENTO').AsDateTime);
        cds.FieldByName('OBSERVACAO').AsString := cdsAlertaMedicao.FieldByName('OBSERVACAO').AsString;
        cds.FieldByName('IDCONTRATO').AsInteger := cdsAlertaMedicao.FieldByName('IDCONTRATO').AsInteger;
        cds.FieldByName('IDOBJETO').AsInteger := cdsAlertaMedicao.FieldByName('IDOBJETO').AsInteger;
        cds.FieldByName('IDITEM').AsInteger := cdsAlertaMedicao.FieldByName('IDITEM').AsInteger;
        cds.FieldByName('PARCELANUM').AsInteger := cdsAlertaMedicao.FieldByName('PARCELANUM').AsInteger;
        cds.FieldByName('IDPARCMEDICAO').AsInteger := cdsAlertaMedicao.FieldByName('IDPARCMEDICAO').AsInteger;
        cds.FieldByName('IDADITAMENTO').AsInteger := cdsAlertaMedicao.FieldByName('IDADITAMENTO').AsInteger;
        cds.Post;
     end;

     cdsAlertaMedicao.Next;
  end;
  cds.First;

  btnMedirContrato.Enabled := not(Cds.IsEmpty);
end;

end.
