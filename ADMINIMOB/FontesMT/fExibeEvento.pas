unit fExibeEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, ImgList, uCtrlEventoImovel, Db,
  DBClient, uCMClientDataSet, wwriched, Mask, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmExibeEvento = class(TfrmSairAjuda)
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    lblOrigem: TLabel;
    edtOrigem: TEdit;
    bbExibir: TBitBtn;
    ilImagens: TImageList;
    DBedtDataHistorico: TCMDateTimePicker;
    DBedtHistorico: TDBEdit;
    DBmemDescricao: TwwDBRichEdit;
    DBedtUsuario: TDBEdit;
    cdsEvento: TCMClientDataSet;
    dsEvento: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbExibirClick(Sender: TObject);
  private
    FTipo: Integer;
    FIdChave: Integer;
    CtrlEventoImovel : TCtrlEventoImovel;
    procedure SetTipo(const Value: Integer);
    procedure SetIdChave(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    Property Tipo : Integer read FTipo write SetTipo;
    Property IdChave : Integer read FIdChave write SetIdChave;

    Procedure AbreEvento (Const iIdEventoImovel: Integer; const iContrato : Integer);
  end;

var
  frmExibeEvento: TfrmExibeEvento;

implementation

uses uSistema, dBaseDados, uMensErro, uComunsImobiliario, uModuloImobiliario,
  FPrincipal, fCadContratoImovelMT, RLancImovelNovo, fCadImovelMT;

{$R *.DFM}

{ TfrmExibeEvento }

procedure TfrmExibeEvento.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlEventoImovel := TCtrlEventoImovel.Create;
  CtrlEventoImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);
end;

procedure TfrmExibeEvento.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlEventoImovel );
  inherited;
end;


procedure TfrmExibeEvento.AbreEvento(const iIdEventoImovel: Integer; const iContrato : Integer);
var image : TBitMap;
begin
   // Abre a tela de contrato já com o contrato selecionado
   cdsEvento.Data := CtrlEventoImovel.LookupEventoImovel(iIdEventoImovel, -1, iContrato, -1, -1, False);

   try
      try
         image := TBitMap.Create;
         if Tipo in[9,10] then begin
            ilImagens.GetBitmap(2, image);
            bbExibir.Glyph.Assign( image );
            bbExibir.Caption := '&Exibe Documento';
            if Tipo = 9 then
                 bbExibir.Enabled := False
            else bbExibir.Enabled := (frmPrincipal.Consulta1.Enabled);
         end;
         if Tipo in[11] then begin
            ilImagens.GetBitmap(1, image);
            bbExibir.Glyph.Assign( image );
            bbExibir.Caption := '&Exibe Imóvel';
            bbExibir.Enabled := ( (frmPrincipal.ImveisDadosprincipais1.Enabled) or (frmPrincipal.btnCadImovel.Enabled) );
         end;
         if Tipo in[12] then begin
            ilImagens.GetBitmap(0, image);
            bbExibir.Glyph.Assign( image );
            bbExibir.Caption := '&Exibe Contrato';
            bbExibir.Enabled := ( (frmPrincipal.deLocao1.Enabled) or (frmPrincipal.btnCadContrato.Enabled) );
         end;
         if Tipo in[13] then begin       // Alienação não exibe a consulta
            ilImagens.GetBitmap(0, image);
            bbExibir.Glyph.Assign( image );
            bbExibir.Caption := '&Exibe Contrato';
            bbExibir.Enabled := False;
         end;

      except
      end;
   finally
      image.free;
   end;
   Show;
end;

procedure TfrmExibeEvento.SetIdChave(const Value: Integer);
begin
  FIdChave := Value;
end;

procedure TfrmExibeEvento.SetTipo(const Value: Integer);
begin
  FTipo := Value;
end;


procedure TfrmExibeEvento.bbExibirClick(Sender: TObject);
begin
  inherited;
  if Tipo = 10 then begin
     frmRelLancImovelNovo := TfrmRelLancImovelNovo.Create(self);
     frmRelLancImovelNovo.iDocumento := IdChave;
     frmRelLancImovelNovo.Seleciona;
     frmRelLancImovelNovo.Show;
  end else if Tipo = 11 then begin
     Application.CreateForm(TfrmCadImovelMT, frmCadImovelMT);
     frmCadImovelMT.AbreImovel( IdChave );
  end else if Tipo = 12 then begin
     Application.CreateForm(TfrmCadContratoImovelMT, frmCadContratoImovelMT);
     frmCadContratoImovelMT.AbreContrato( IdChave );
  end;
end;

end.
