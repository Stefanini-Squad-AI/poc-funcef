unit fCadParamAditamentoMT;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Sol..........: 242313/17289
N. PPM..........: 828977
Data............: 19/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: adicionando os campo da tabela CONTRATOANS nos
                  parâmetros de aditamento.
--------------------------------------------------------------------------------}
// -----------------------------------------------------------------------------
//
//      CADASTRO DE PARAMETROS DE ADITAMENTO  ( MT )
//
//      Módulo          :  Contratos e Projetos
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  15/05/2003
//      Data de Término :  15/05/2003
//
// -----------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, fcButton, fcImgBtn, fcShapeBtn, Grids,
  Wwdbigrd, Wwdbgrid, DBCtrls, Db, DBClient, uCMClientDataSet, uCtrlParamAditamento;

type
  TfrmCadParamAditamentoMT = class(TfrmSairAjuda)
    Panel1: TPanel;
    Panel3: TPanel;
    DBgrdNaoRegistrados: TwwDBGrid;
    btnLFUm: TfcShapeBtn;
    btnLFTodos: TfcShapeBtn;
    btnFLUm: TfcShapeBtn;
    btnFLTodos: TfcShapeBtn;
    DBgrdRegistrados: TwwDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    cdsNaoRegistra: TCMClientDataSet;
    dsNaoRegistra: TDataSource;
    cdsRegistra: TCMClientDataSet;
    dsRegistra: TDataSource;
    cbTela: TComboBox;

     // Felipe A. Santos SOL 242313/17289 PPM 828977 {fim cdsAux}
    cdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure cbTelaChange(Sender: TObject);
    procedure btnLFUmClick(Sender: TObject);
    procedure btnFLUmClick(Sender: TObject);
    procedure btnLFTodosClick(Sender: TObject);
    procedure btnFLTodosClick(Sender: TObject);
  private
    { Private declarations }
    CtrlParamAditamento : TCtrlParamAditamento;

    procedure AbreTabelas;
  public
    { Public declarations }
  end;

var
  frmCadParamAditamentoMT: TfrmCadParamAditamentoMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadParamAditamentoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamAditamento := TCtrlParamAditamento.Create;
  CtrlParamAditamento.Initialize(dtmBaseDados.dbBaseDados,True);

  cdsRegistra.Data    := CtrlParamAditamento.ListParamAditamento('-1');
  cdsNaoRegistra.Data := CtrlParamAditamento.ListParamAditamento('-1');

  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  cdsRegistra.IndexFieldNames := 'DESCRICAO';
  cdsNaoRegistra.IndexFieldNames := 'DESCRICAO';
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
end;

procedure TfrmCadParamAditamentoMT.AbreTabelas;
var sTabela : String;
   x : integer; // Felipe A. Santos SOL 242313/17289 PPM 828977
begin
  case cbTela.ItemIndex of
    0 : sTabela := 'CONTRATOCONTR';
    1 : sTabela := 'CORRECAOCONTR';
    2 : sTabela := 'OBJETOSXITEMCONTR';
  end;

  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  if (cbTela.ItemIndex = 0) then
  begin
    cdsRegistra.EmptyDataSet;
    cdsNaoRegistra.EmptyDataSet;

    for x := 0 to 1 do
    begin
      if x = 0 then
       sTabela := 'CONTRATOCONTR'
      else
       sTabela := 'CONTRATOANS';   

      cdsAux.Data := CtrlParamAditamento.ListParamAditamento(sTabela, True );
      cdsAux.First;
      while not cdsAux.Eof do begin
        cdsRegistra.Insert;
        cdsRegistra.FieldByName('IDDDFIELD').AsInteger := cdsAux.FieldByName('IDDDFIELD').AsInteger;
        cdsRegistra.FieldByName('TABLENAME').AsString := cdsAux.FieldByName('TABLENAME').AsString;
        cdsRegistra.FieldByName('FIELDNAME').AsString := cdsAux.FieldByName('FIELDNAME').AsString;
        cdsRegistra.FieldByName('DESCRICAO').AsString := cdsAux.FieldByName('DESCRICAO').AsString;
        cdsRegistra.Post;

        cdsAux.Next;
      end;

      cdsAux.Data := CtrlParamAditamento.ListParamAditamento(sTabela, False );
      cdsAux.First;
      while not cdsAux.Eof do begin
        cdsNaoRegistra.Insert;
        cdsNaoRegistra.FieldByName('IDDDFIELD').AsInteger := cdsAux.FieldByName('IDDDFIELD').AsInteger;
        cdsNaoRegistra.FieldByName('TABLENAME').AsString := cdsAux.FieldByName('TABLENAME').AsString;
        cdsNaoRegistra.FieldByName('FIELDNAME').AsString := cdsAux.FieldByName('FIELDNAME').AsString;
        cdsNaoRegistra.FieldByName('DESCRICAO').AsString := cdsAux.FieldByName('DESCRICAO').AsString;
        cdsNaoRegistra.Post;

        cdsAux.Next;
      end;
    end;


  end
  else
  begin
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
    cdsRegistra.Data := CtrlParamAditamento.ListParamAditamento(sTabela, True );
    cdsNaoRegistra.Data := CtrlParamAditamento.ListParamAditamento(sTabela, False);
  end; // Felipe A. Santos SOL 242313/17289 PPM 828977

end;

procedure TfrmCadParamAditamentoMT.cbTelaChange(Sender: TObject);
begin
  inherited;
  AbreTabelas;
end;


procedure TfrmCadParamAditamentoMT.btnLFUmClick(Sender: TObject);
begin
  inherited;
  if not cdsNaoRegistra.IsEmpty then begin
    CtrlParamAditamento.AplicaParamAditamento(cdsNaoRegistra.FieldByName('IDDDFIELD').AsInteger,'I');
    AbreTabelas;
  end;
end;

procedure TfrmCadParamAditamentoMT.btnFLUmClick(Sender: TObject);
begin
  inherited;
  if not cdsRegistra.IsEmpty then begin
    CtrlParamAditamento.AplicaParamAditamento(cdsRegistra.FieldByName('IDDDFIELD').AsInteger,'E');
    AbreTabelas;
  end;
end;

procedure TfrmCadParamAditamentoMT.btnLFTodosClick(Sender: TObject);
begin
  inherited;
  with cdsNaoRegistra do begin
    if not IsEmpty then begin
      DisableControls;
      First;
      while not eof do begin
        CtrlParamAditamento.AplicaParamAditamento(FieldByName('IDDDFIELD').AsInteger,'I');
        Next;
      end;
    end;
    EnableControls;
    AbreTabelas;
  end;
end;

procedure TfrmCadParamAditamentoMT.btnFLTodosClick(Sender: TObject);
begin
  inherited;
  with cdsRegistra do begin
    if not IsEmpty then begin
      DisableControls;
      First;
      while not eof do begin
        CtrlParamAditamento.AplicaParamAditamento(FieldByName('IDDDFIELD').AsInteger,'E');
        Next;
      end;
    end;
    EnableControls;
    AbreTabelas;
  end;
end;

end.
