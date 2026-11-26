// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 26.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------

unit FConsProcessoBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, MontaSelect,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmConsProcessoBenef = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    dbgProcessos: TwwDBGrid;
    dsProcessoBenef: TwwDataSource;
    qryProcessoBenef: TwwQuery;
    MontaSelectPart: TMontaSelect;
    qryProcessoBenefNUMEROPROCESSO: TFloatField;
    qryProcessoBenefEVENTOGERADOR: TStringField;
    qryProcessoBenefDTEVENTO: TDateTimeField;
    qryProcessoBenefDTREGISTRO: TDateTimeField;
    qryProcessoBenefPARTICIPANTE: TStringField;
    qryProcessoBenefPLANO: TStringField;
    qryProcessoBenefPATRO: TStringField;
    qryProcessoBenefBENEFICIO: TStringField;
    qryProcessoBenefBENEFICIARIO: TStringField;
    qryProcessoBenefSITBENEFICIO: TStringField;
    qryProcessoBenefDATAINICIO: TDateTimeField;
    qryProcessoBenefDATAFINAL: TDateTimeField;
    qryProcessoBenefVALORCALCULADO: TFloatField;
    qryProcessoBenefVALORATUAL: TFloatField;
    qryProcessoBenefVALORCOTAS: TFloatField;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edNome: TEdit;
    Label8: TLabel;
    edMatricula: TEdit;
    edInscNumero: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    edPlano: TEdit;
    Label3: TLabel;
    edPatro: TEdit;
    Label5: TLabel;
    edSitPatro: TEdit;
    Label6: TLabel;
    edSitPlano: TEdit;
    Label14: TLabel;
    edSitFundacao: TEdit;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    EdMatricBeneficiario: TEdit;
    Label7: TLabel;
    EdNomeBeneficiario: TEdit;
    Label9: TLabel;
    Bevel1: TBevel;
    MontaSelect: TMontaSelect;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sIdTitular, sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    procedure CarregaGrid;
  public
    { Public declarations }
  end;

var
  frmConsProcessoBenef: TfrmConsProcessoBenef;

implementation

uses
  UAdmPrev;
    
{$R *.DFM}

procedure TfrmConsProcessoBenef.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  if (MontaSelect.RetornouValor) then begin


    {Carrega Campos}
    sIdPessoa          := MontaSelect.ValoresChave[1];
    sIdPessJur         := MontaSelect.ValoresChave[0];
    sIdPlanoPrev       := MontaSelect.ValoresChave[2];
    sSeqProposta       := MontaSelect.ValoresChave[11];
    sIdTitular         := MontaSelect.ValoresChave[12];

    edNome.Text        := MontaSelect.ValoresChave[9];
    edMatricula.Text   := MontaSelect.ValoresChave[10];
    edPatro.Text       := MontaSelect.ValoresChave[8];
    edPlano.Text       := MontaSelect.ValoresChave[7];
    edSitPatro.Text    := MontaSelect.ValoresChave[3];
    edSitFundacao.Text := MontaSelect.ValoresChave[4];
    edSitPlano.Text    := MontaSelect.ValoresChave[5];
    edInscNumero.Text  := MontaSelect.ValoresChave[6];
    EdMatricBeneficiario.Text := MontaSelect.ValoresChave[13];
    EdNomeBeneficiario.Text   := MontaSelect.ValoresChave[14];

    { Monta Dados do Beneficiario }
    If MontaSelect.ValoresChave[1] = MontaSelect.ValoresChave[12] Then Begin
      EdMatricBeneficiario.Text := ' ';
      EdNomeBeneficiario.Text   := ' ';
    End;
    CarregaGrid;
    {Fim - Carrega Campos}
  end;
end;

procedure TfrmConsProcessoBenef.CarregaGrid;
begin
  qryProcessoBenef.Close;
  qryProcessoBenef.ParamByName('pIdTitular').AsString   := sIdTitular;
  qryProcessoBenef.ParamByName('pIdPlanoPrev').AsString := sIdPlanoPrev;
  qryProcessoBenef.ParamByName('pIdPessJur').AsString   := sIdPessJur;
  qryProcessoBenef.ParamByName('pSeqProposta').AsString := sSeqProposta;
  qryProcessoBenef.Open;
end;


procedure TfrmConsProcessoBenef.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 

end;

end.
