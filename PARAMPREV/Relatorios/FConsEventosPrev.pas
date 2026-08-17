// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 26.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FConsEventosPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, MontaSelect,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmConsEventosPrev = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    dbgEventosPrev: TwwDBGrid;
    dsEventosPrev: TwwDataSource;
    qryEventosPrev: TwwQuery;
    MontaSelectPart: TMontaSelect;
    lblValores: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    qryEventosPrevNOME: TStringField;
    qryEventosPrevDATAEVENTO: TDateTimeField;
    qryEventosPrevDATAREGISTRO: TDateTimeField;
    qryEventosPrevDATAEFETIVADO: TDateTimeField;
    qryEventosPrevDATAVOLTA: TDateTimeField;
    qryEventosPrevSITPLANOATUAL: TStringField;
    qryEventosPrevSITPARTATUAL: TStringField;
    qryEventosPrevSITPLANONOVO: TStringField;
    qryEventosPrevSITPARTNOVO: TStringField;
    GroupBox2: TGroupBox;
    dbgHstContFechado: TwwDBGrid;
    dsHstContF: TwwDataSource;
    qryHstContF: TwwQuery;
    qryHstContFFLGASSOCIADA: TFloatField;
    qryEventosPrevIDEVENTOSPREV: TFloatField;
    Label3: TLabel;
    edPlano: TEdit;
    Label1: TLabel;
    edInscNumero: TEdit;
    Label8: TLabel;
    edMatricula: TEdit;
    Panel5: TPanel;
    Shape1: TShape;
    Shape4: TShape;
    Label11: TLabel;
    Label5: TLabel;
    qryHstContFCONTRIBUICAOF: TStringField;
    qryEventosPrevSITFUNCATUAL: TStringField;
    qryEventosPrevSITFUNCNOVO: TStringField;
    qryEventosPrevINSCRICAONUMERO: TFloatField;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure qryEventosPrevAfterScroll(DataSet: TDataSet);
    procedure dbgHstContFechadoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;
              AFont: TFont; ABrush: TBrush);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sIdPessoa, sIdPessJur, sIdPlanoPrev: string;
    procedure CarregaGrid;
  public
    { Public declarations }
  end;

var
  frmConsEventosPrev: TfrmConsEventosPrev;

implementation

uses
  UAdmPrev;

{$R *.DFM}

procedure TfrmConsEventosPrev.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
      begin
          {Carrega Campos}
           sIdPessoa          := MontaSelectPart.ValoresChave[0];
           sIdPessJur         := MontaSelectPart.ValoresChave[1];
           sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
           edNome.Text        := MontaSelectPart.ValoresChave[3];
           edMatricula.Text   := MontaSelectPart.ValoresChave[4];
           edPatro.Text       := MontaSelectPart.ValoresChave[5];
           edPlano.Text       := MontaSelectPart.ValoresChave[6];
           edInscNumero.Text  := MontaSelectPart.ValoresChave[12];

                      CarregaGrid;
          {Fim - Carrega Campos}
      end;
end;

procedure TfrmConsEventosPrev.CarregaGrid;
begin
  qryEventosPrev.Close;
  qryEventosPrev.ParamByName('pIdPessoa').AsString    := sIdPessoa;
  qryEventosPrev.ParamByName('pIdPlanoPrev').AsString := sIdPlanoPrev;
  qryEventosPrev.ParamByName('pIdPessJur').AsString   := sIdPessJur;
  qryEventosPrev.Open;
end;

procedure TfrmConsEventosPrev.qryEventosPrevAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryHstContF.Close; // Histórico de Contribuições por eventos(Fechado)
  qryHstContF.ParamByName('pIdEventosPrev').AsString := qryEventosPrev.FieldByName('IDEVENTOSPREV').AsString;
  qryHstContF.Open;
end;

procedure TfrmConsEventosPrev.dbgHstContFechadoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if (qryEventosPrev.State in [dsInactive]) or
     (qryHstContF.State in [dsInactive]) then
      exit;


  if qryHstContF.FieldByName('FLGASSOCIADA').AsString = '0' then
     begin
          ABrush.Color := clMaroon;
          AFont.Color  := clWindow;
          if highlight then
             begin
                  ABrush.Color := clMaroon;
                  AFont.Color  := clWindow;
             end;
     end
  else
  if qryHstContF.FieldByName('FLGASSOCIADA').AsString = '1' then
     begin
          ABrush.Color := clTeal;
          AFont.Color  := clWindow;
          if highlight then
             begin
                  ABrush.Color := clTeal;
                  AFont.Color  := clWindow;
             end;
     end;
end;

procedure TfrmConsEventosPrev.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 26.06.2003
end;

end.
