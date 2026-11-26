// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Augusto
//  Rotina     : MontaSelect
//  Pendência  : 19491
//  Data       : 20/06/2005
//  Descricao  : Não trazer participantes assistidos ou cancelados 
//------------------------------------------------------------------------------
unit FSelecionaParticipantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, Db,
  DBTables, Wwquery, Wwdatsrc, Mask, wwdbedit;

type
  TfrmSelecionaParticipantes = class(TfrmOkCancelar)
    pnlParticipante: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    dbgrdParticipantes: TwwDBGrid;
    Label1: TLabel;
    Panel2: TPanel;
    sbtnAssocia: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    lblPatro: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    MontaSelectPart: TMontaSelect;
    bbtnProcurar: TBitBtn;
    qryParticipante: TwwQuery;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    dsParticipante: TwwDataSource;
    qrySelecionados: TwwQuery;
    updSelecionados: TUpdateSQL;
    dsSelecionados: TwwDataSource;

    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnDesassociaClick(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }

  
  end;



var
  frmSelecionaParticipantes: TfrmSelecionaParticipantes;



implementation
{$R *.DFM}



procedure TfrmSelecionaParticipantes.bbtnProcurarClick(Sender: TObject);
var iIdPessJur, iIdPessoa, iIdPlanoPrev, iSeqProposta : longint;
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count <= 0) or (MontaSelectPart.ValoresChave[0] = '')
  then Exit;

  iIdPessJur    := StrToInt(MontaSelectPart.ValoresChave[0]);
  iIdPlanoPrev  := StrToInt(MontaSelectPart.ValoresChave[1]);
  iIdPessoa     := StrToInt(MontaSelectPart.ValoresChave[2]);
  iSeqProposta  := StrToInt(MontaSelectPart.ValoresChave[3]);

  qryParticipante.Close;
  qryParticipante.ParamByName('IdPessJur').AsInteger    := iIdPessJur;
  qryParticipante.ParamByName('IdPlanoPrev').AsInteger  := iIdPlanoPrev;
  qryParticipante.ParamByName('IdPessoa').AsInteger     := iIdPessoa;
  qryParticipante.ParamByName('SeqProposta').AsInteger  := iSeqProposta;
  qryParticipante.Open;
  if qryParticipante.IsEmpty then Exit;
end;

procedure TfrmSelecionaParticipantes.FormShow(Sender: TObject);
begin
  inherited;
  with qryParticipante do
  begin
     Close;
     ParamByName('IdPessJur').AsInteger    := -1;
     ParamByName('IdPlanoPrev').AsInteger  := -1;
     ParamByName('IdPessoa').AsInteger     := -1;
     ParamByName('SeqProposta').AsInteger  := -1;
     Open;
  end;

  with qrySelecionados do
  begin
     Close;
     ParamByName('IdPessJur').AsInteger    := -1;
     ParamByName('IdPlanoPrev').AsInteger  := -1;
     ParamByName('IdPessoa').AsInteger     := -1;
     ParamByName('SeqProposta').AsInteger  := -1;
     Open;
  end;

end;

procedure TfrmSelecionaParticipantes.sbtnAssociaClick(Sender: TObject);
begin
  inherited;
  with qrySelecionados do
  begin
     Insert;
     FieldByName('NOME').AsString            := qryParticipante.FieldByName('NOME').AsString;
     FieldByName('NOMEPATRO').AsString       := qryParticipante.FieldByName('NOMEPATRO').AsString;
     FieldByName('NOMEPLANO').AsString       := qryParticipante.FieldByName('NOMEPLANO').AsString;
     FieldByName('MATRICULA').AsString       := qryParticipante.FieldByName('MATRICULA').AsString;
     FieldByName('IDPESSJUR').AsInteger      := qryParticipante.FieldByName('IDPESSJUR').AsInteger;
     FieldByName('IDPLANOPREV').AsInteger    := qryParticipante.FieldByName('IDPLANOPREV').AsInteger;
     FieldByName('IDPESSOA').AsInteger       := qryParticipante.FieldByName('IDPESSOA').AsInteger;
     FieldByName('SEQPROPOSTA').AsInteger    := qryParticipante.FieldByName('SEQPROPOSTA').AsInteger;
     FieldByName('FLGINTERNO').AsString      := qryParticipante.FieldByName('FLGINTERNO').AsString;
     FieldByName('INSCRICAONUMERO').AsInteger:= qryParticipante.FieldByName('INSCRICAONUMERO').AsInteger;
     Post;
  end;
end;

procedure TfrmSelecionaParticipantes.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  with qrySelecionados do
  begin
     Delete;
     Post;
  end;
end;



procedure TfrmSelecionaParticipantes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
//  inherited;
end;



end.