unit mHotel;

// -----------------------------------------------------------------------------
//
//      FRAME PARA SELEÇÃO DE HOTEIS  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  12/11/2002
//      Data de Término :  12/11/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
  uCMClientDataSet, Buttons, DBCtrls, Db, DBClient, wwdblook, uCtrlContratoLoja;

type
  TmolHotel = class(TFrame)
    GroupBox1: TGroupBox;
    chklbHotel: TCheckListBox;
    sbSeleciona: TSpeedButton;
    sbDesmarca: TSpeedButton;
    procedure sbSelecionaClick(Sender: TObject);
    procedure sbDesmarcaClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContratoLoja : TCtrlContratoLoja;
    cdsHotel         : TCMClientDataSet;
    procedure MontaCheckBoxList;
  public
    { Public declarations }
    cdsResult : TCMClientDataSet;
    procedure InicializaFrame;
    procedure DestroiFrame;
    procedure BuscaResult;
  end;

implementation

{$R *.DFM}

{ TmolCotas }


// -----------------------------------------------------------------------------
// Método que Destroi os objetos criados no frame
// Deve ser executado no OnDestroy do form que for utilizá-lo
// -----------------------------------------------------------------------------
procedure TmolHotel.DestroiFrame;
begin
  FreeAndNil( CtrlContratoLoja );
end;

// -----------------------------------------------------------------------------
// Método que Inicializa os objetos criados no frame
// Deve ser executado no OnCreate do form que for utilizá-lo
// -----------------------------------------------------------------------------
procedure TmolHotel.InicializaFrame;
begin
  CtrlContratoLoja := TCtrlContratoLoja.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlContratoLoja.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                       ComunsImobiliario.MensErroMT);

  cdsResult := TCMClientDataSet.Create( nil );

  MontaCheckBoxList;
end;


// -----------------------------------------------------------------------------
// Método que preenche o cdsResult com o conteúdo do CheckList
// Deve ser executado no ANTES de utilizar o cdsResult
// -----------------------------------------------------------------------------
procedure TmolHotel.BuscaResult;
var i, iimovel : Integer;
begin
  // Inicializa a Estrutura sem registros
  cdsResult.Data := CtrlContratoLoja.LookupContratoLoja( -2 );
  cdsResult.IndexFieldNames := 'NOMCONTRATO';
  for i := 0 to (chklbHotel.Items.Count - 1) do begin
    if chklbHotel.Checked[i] = True then begin
      cdsHotel.RecNo := i + 1;
      cdsResult.Insert;
      iimovel := cdsHotel.FieldByName('IDIMOVEL').AsInteger;
      cdsResult.FieldByName('IDIMOVEL').AsInteger   := cdsHotel.FieldByName('IDIMOVEL').AsInteger;
      cdsResult.FieldByName('IDCONTRATO').AsInteger := cdsHotel.FieldByName('IDCONTRATO').AsInteger;
      cdsResult.FieldByName('NOMCONTRATO').AsString := cdsHotel.FieldByName('NOMCONTRATO').AsString;
      cdsResult.FieldByName('IDIMOVEL').AsInteger := iimovel;
      cdsResult.Post;
    end;
  end;
end;


procedure TmolHotel.MontaCheckBoxList;
begin
  cdsHotel := TCMClientDataSet.Create( nil );
  cdsHotel.Data := CtrlContratoLoja.LookupContratoLoja(-1, -1, opCalcular, -1, '', 'H', 2);
  chklbHotel.Items.Clear;
  while not cdsHotel.Eof do begin
    chklbHotel.Items.Add(cdsHotel.FieldByName('NOMCONTRATO').AsString);
    cdsHotel.Next;
  end;
end;

procedure TmolHotel.sbSelecionaClick(Sender: TObject);
var i : Integer;
begin
  for i := 0 to (chklbHotel.Items.Count - 1) do chklbHotel.Checked[i] := True;
end;

procedure TmolHotel.sbDesmarcaClick(Sender: TObject);
var i : Integer;
begin
  for i := 0 to (chklbHotel.Items.Count - 1) do chklbHotel.Checked[i] := False;
end;

end.
