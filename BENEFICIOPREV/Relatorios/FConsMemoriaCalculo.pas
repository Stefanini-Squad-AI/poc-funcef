unit FConsMemoriaCalculo;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)  : Otacilio Aquino
// Data      : 31/10/2011
// SOL       : SOL 167275  KINTANA 1467665
// Alteração : Alteração na qryDetCalculo adicionando 'Percentual do Grupo Familiar:',
// 'Valor Total da Pensão'
//------------------------------------------------------------------------------
// Autor(a)  : Otacilio Aquino
// Data      : 13/09/2011
// Pendencia : SOL 148269  KINTANA 1416836
// Alteração : Alteração na qryDetCalculo adicionando o filtro descricao
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, Mask,
  wwdbedit, wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmConsMemoriaCalculo = class(TfrmOkCancelar)
    MontaSelect: TMontaSelect;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edPlano: TEdit;
    edInscNumero: TEdit;
    edMatricula: TEdit;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    lblValores: TLabel;
    Label5: TLabel;
    edBeneficiario: TEdit;
    Panel1: TPanel;
    Label6: TLabel;
    qryCalculo: TwwQuery;
    dsCalculo: TwwDataSource;
    dblkpcmbCalculo: TwwDBLookupCombo;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    dsDetCalculo: TwwDataSource;
    qryDetCalculo: TwwQuery;
    dbgrdDetCalculo: TwwDBGrid;
    wwDBEdit3: TwwDBEdit;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpcmbCalculoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryCalculoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    sIdPessoa : string;
  public
    { Public declarations }
  end;

var
  frmConsMemoriaCalculo: TfrmConsMemoriaCalculo;

implementation

{$R *.DFM}

procedure TfrmConsMemoriaCalculo.bbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     if (MontaSelect.ValoresChave[19] <> '') and (MontaSelect.ValoresChave[19] <> MontaSelect.ValoresChave[0])
     then sIdPessoa      := MontaSelect.ValoresChave[19]
     else sIdPessoa      := MontaSelect.ValoresChave[0];

     edNome.Text         := MontaSelect.ValoresChave[3];
     edMatricula.Text    := MontaSelect.ValoresChave[4];
     edPatro.Text        := MontaSelect.ValoresChave[5];
     edPlano.Text        := MontaSelect.ValoresChave[6];
     edInscNumero.Text   := MontaSelect.ValoresChave[12];
     edBeneficiario.Text := MontaSelect.ValoresChave[20];

     qryCalculo.Close;
     qryCalculo.ParamByName('IDPESSOA').AsInteger := StrToInt(sIdPessoa);
     qryCalculo.Open;

     qryDetCalculo.Close;
     qryDetCalculo.ParamByName('IDCALCULO').AsInteger := qryCalculo.FieldByName('IDCALCULO').AsInteger;
     qryDetCalculo.ParamByName('IDPESSOA').AsInteger := StrToInt(sIdPessoa);
     qryDetCalculo.Open;

     dblkpcmbCalculo.Text := qryCalculo.FieldByName('IDCALCULO').AsString;
  end;
end;

procedure TfrmConsMemoriaCalculo.FormActivate(Sender: TObject);
begin
  inherited;
  sIdPessoa          := '-1';
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edInscNumero.Text  := '';
  edBeneficiario.Text := '';

  qryCalculo.Close;
  qryCalculo.ParamByName('IDPESSOA').AsInteger := -1;
  qryCalculo.Open;

  qryDetCalculo.Close;
  qryDetCalculo.ParamByName('IDCALCULO').AsInteger := -1;
  qryDetCalculo.ParamByName('IDPESSOA').AsInteger := -1;
  qryDetCalculo.Open;
  dblkpcmbCalculo.Text := '';

end;

procedure TfrmConsMemoriaCalculo.dblkpcmbCalculoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryDetCalculo.Close;
  qryDetCalculo.ParamByName('IDCALCULO').AsInteger := qryCalculo.FieldByName('IDCALCULO').AsInteger;
  qryDetCalculo.ParamByName('IDPESSOA').AsInteger := StrToInt(sIdPessoa);  
  qryDetCalculo.Open;

  dblkpcmbCalculo.Text := qryCalculo.FieldByName('IDCALCULO').AsString;
end;

procedure TfrmConsMemoriaCalculo.qryCalculoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryDetCalculo.Close;
  qryDetCalculo.ParamByName('IDCALCULO').AsInteger := qryCalculo.FieldByName('IDCALCULO').AsInteger;
  qryDetCalculo.ParamByName('IDPESSOA').AsInteger := StrToInt(sIdPessoa);
  qryDetCalculo.Open;
end;

end.
