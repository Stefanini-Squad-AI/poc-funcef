{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Pag Santander      }
{   COBRANÇA REGISTRADA SANTANDER                       }
{   IDMODELOSCNAB = 10/R                                }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FParamCnabSantanderMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, ComCtrls, Spin, TREdit, TEdNum;

type
  TfrmParamCnabSantanderMT = class(TfrmOkCancelar)
    PageControl1: TPageControl;
    TbsMensagens: TTabSheet;
    TbsGeral: TTabSheet;
    Label15: TLabel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    edtMensagem1: TMaskEdit;
    edtMensagem2: TMaskEdit;
    rgTipoCobranca: TRadioGroup;
    rgFormaCadastramento: TRadioGroup;
    rgAceite: TRadioGroup;
    rgEspecieTitulo: TRadioGroup;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    rgCodigoMora: TRadioGroup;
    gbiof: TGroupBox;
    Label9: TLabel;
    Label14: TLabel;
    RedtIOF: TRealEdit;
    speProtesto: TSpinEdit;
    gbmulta: TGroupBox;
    lbmulta: TLabel;
    redtValorMora: TRealEdit;
    Label6: TLabel;
    Label2: TLabel;
    speDiasBaixa: TSpinEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgCodigoMoraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCnabSantanderMT: TfrmParamCnabSantanderMT;

implementation

uses uIntBancoManager, uString;

{$R *.DFM}

procedure TfrmParamCnabSantanderMT.bbtnConfirmarClick(Sender: TObject);
var
  sTipoCobranca,
  sEspecieTitulo,
  sFormaCadasTramento,
  sAceite,
  sCodigoMora,
  sValorMora,
  sDiasBaixa,
  sDiasProtesto,
  sIOF : String;
begin
  inherited;
  with IntBancoManager do
  begin
    case rgTipoCobranca.ItemIndex of
      0: sTipoCobranca := '1';
      1: sTipoCobranca := '3';
      2: sTipoCobranca := '4';
      3: sTipoCobranca := '5';
    end;

    case rgEspecieTitulo.ItemIndex of
      0: sEspecieTitulo := '02';
      1: sEspecieTitulo := '04';
      2: sEspecieTitulo := '12';
      3: sEspecieTitulo := '17';
      4: sEspecieTitulo := '20';
    end;
    if rgAceite.ItemIndex = 0 then
      sAceite := 'A'
    else
      sAceite := 'N';

    sFormaCadastramento := IntToStr(rgFormaCadastramento.ItemIndex + 1);
    sCodigoMora         := IntToStr(rgCodigoMora.ItemIndex + 1);

    sValorMora          := ZD(RemoveVirgulas(rEdtValorMora.Value,2),15);

    sDiasBaixa          := ZD(IntToStr(speDiasBaixa.Value),3);
    sDiasProtesto       := ZD(IntToStr(speProtesto.Value),2);
    sIOF                := ZD(RemoveVirgulas(rEdtIOF.Value,5),15);

    GravaParamIntBanco(
        [
        'MENSAGEMLOTE1',
        'MENSAGEMLOTE2',
        'CODIGOMORA',
        'VALORMORA',
        'TIPOCOBRANCA',
        'FORMACADASTRAMENTO',
        'ESPECIETITULO',
        'ACEITE',
        'IOF',
        'DIASPROTESTO',
        'DIASBAIXA'
        ],

        [
        edtMensagem1.text,
        edtMensagem2.text,
        sCodigoMora,
        sValorMora,
        sTipoCobranca,
        sFormaCadastramento,
        sEspecieTitulo,
        sAceite,
        sIOF,
        sDiasProtesto,
        sDiasBaixa
        ]);
  end;
  ModalResult := mrOk;
end;

procedure TfrmParamCnabSantanderMT.rgCodigoMoraClick(Sender: TObject);
begin
  inherited;
  if (rgCodigoMora.ItemIndex = 2) or (rgCodigoMora.ItemIndex = 4) then
  begin
    redtValorMora.Enabled := False;
    redtValorMora.Value   := 0;
  end
  else
    redtValorMora.Enabled := True;
end;

procedure TfrmParamCnabSantanderMT.FormCreate(Sender: TObject);
begin
  inherited;
Try
  with IntBancoManager do
  begin

    case StrToInt(BuscaParamIntBanco('TIPOCOBRANCA', 'N')) of
      1: rgTipoCobranca.ItemIndex := 0;
      3: rgTipoCobranca.ItemIndex := 1;
      4: rgTipoCobranca.ItemIndex := 2;
      5: rgTipoCobranca.ItemIndex := 3;
    end;

    case StrToInt(BuscaParamIntBanco('ESPECIETITULO', 'N')) of
      2 : rgEspecieTitulo.ItemIndex := 0;
      4 : rgEspecieTitulo.ItemIndex := 1;
      12: rgEspecieTitulo.ItemIndex := 2;
      17: rgEspecieTitulo.ItemIndex := 3;
      20: rgEspecieTitulo.ItemIndex := 4;
    end;

    if BuscaParamIntBanco('ACEITE', 'S') = 'A' then
      rgAceite.ItemIndex := 0
    else
      rgAceite.ItemIndex := 1;
    edtMensagem1.Text              := BuscaParamIntBanco('MENSAGEMLOTE1', 'S');
    edtMensagem2.Text              := BuscaParamIntBanco('MENSAGEMLOTE2', 'S');
    rgFormaCadastramento.ItemIndex := StrToInt(BuscaParamIntBanco('FORMACADASTRAMENTO', 'N')) - 1;
    rgCodigoMora.ItemIndex         := StrToInt(BuscaParamIntBanco('CODIGOMORA', 'N')) - 1;
    rEdtValorMora.Value            := DevolveVirgulas(BuscaParamIntBanco('VALORMORA', 'N'),2);
    speDiasBaixa.Value             := StrToInt(BuscaParamIntBanco('DIASBAIXA', 'N'));
    speProtesto.Value              := StrToInt(BuscaParamIntBanco('DIASPROTESTO', 'N'));
    rEdtIOF.Value                  := DevolveVirgulas(BuscaParamIntBanco('IOF', 'N'),5);
  end;
Except
end;

end;

end.
