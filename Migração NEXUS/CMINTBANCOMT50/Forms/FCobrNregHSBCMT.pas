{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa HSBC               }
{   COBRANÇA NÃO REGISTRADA HSBC - IDMODELOSCNAB = 9/R  }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FCobrNregHSBCMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, TEdNum, Mask,
  TREdit, Spin;

type
  TFrmCobrNregHSBCMT = class(TfrmOkCancelar)
    Label1: TLabel;
    Edtnuform: TEditNum;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    mskobs1: TMaskEdit;
    mskobs2: TMaskEdit;
    mskobs3: TMaskEdit;
    Bevel2: TBevel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCobrNregHSBCMT: TFrmCobrNregHSBCMT;

implementation

uses umenserro, uIntBancoManager, uString;

{$R *.DFM}

procedure TFrmCobrNregHSBCMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (trim(Edtnuform.text) = '') OR (STRTOINT(Edtnuform.text) = 0) then
  begin
       if Edtnuform.canfocus then  Edtnuform.setfocus;
       msgdlg('Preencher Código do Formulário!','Erro',mtError,[mbOk],0);
       exit;
  end;
  With IntBancoManager do
  Begin
    GravaParamIntBanco(['CODIGOFORMULARIO',
                        'PERIODICIDADEPARC',
                        'MONTAGEMCARNES',
                        'VLPARCCONHECIDO'
                      , 'OBS1'
                      , 'OBS2'
                      , 'OBS3'
                      , 'PARCELAINI'
                      , 'PARCELAFINAL'
                      , 'PERCUNICODESC'
                      , 'DIASDESCONTO'
    ],
    [Edtnuform.text,
     '0',
     inttostr(RadioGroup1.ItemIndex),
     'S',
     mskobs1.text,
     mskobs2.text,
     mskobs3.text,
     '1',
     '1',
     '0',
     '0'
     ]);
  end;

  ModalResult:=mrOk;
end;

procedure TFrmCobrNregHSBCMT.FormCreate(Sender: TObject);
begin
  inherited;

  With IntBancoManager do
  Begin
   if trim(BuscaParamIntBanco('CODIGOFORMULARIO','S'))= '' then  exit;//inclusao
     
   Edtnuform.Text               := BuscaParamIntBanco('CODIGOFORMULARIO','N');
   RadioGroup1.ItemIndex        := STRTOINT(BuscaParamIntBanco('MONTAGEMCARNES','N'));
   mskobs1.TEXT               := BuscaParamIntBanco('OBS1','S');
   mskobs2.TEXT               := BuscaParamIntBanco('OBS2','S');
   mskobs3.TEXT               := BuscaParamIntBanco('OBS3','S');
  end;

end;

end.
