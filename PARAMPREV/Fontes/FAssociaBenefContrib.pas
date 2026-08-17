//------------------------------------------------------------------------------
// Autor(a)    : Helio Lima Custódio
// Data        : 12/04/2016
// Pendência   : SOL 253577/18234 PPM 1368001
// Alteração   : Criação da tela.
//------------------------------------------------------------------------------

unit FAssociaBenefContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids, DBGrids,
  DBCtrls, Wwdbigrd, Wwdbgrid, dBaseDados; 


type
  TfrmAssociaBenefContrib = class(TfrmSairAjuda)
    qryBenef: TwwQuery;
    dsBenef: TwwDataSource;
    Panel4: TPanel;
    lblBeneficios: TLabel;
    lblPlanPatro: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    Label10: TLabel;
    Panel5: TPanel;
    btnRemoveContrib: TSpeedButton;
    btnRemoveTodasContrib: TSpeedButton;
    btnAdicionaContrib: TSpeedButton;
    btnAdicionaTodasContrib: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    dsContrib: TwwDataSource;
    qryContrib: TwwQuery;
    dsContribRel: TwwDataSource;
    qryContribRel: TwwQuery;
    dblklstBenef: TDBLookupListBox;
    dblklstContrib: TDBLookupListBox;
    dblklstContribRel: TDBLookupListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryBenefAfterScroll(DataSet: TDataSet);
    procedure btnRemoveContribClick(Sender: TObject);
    procedure btnRemoveTodasContribClick(Sender: TObject);
    procedure btnAdicionaContribClick(Sender: TObject);
    procedure btnAdicionaTodasContribClick(Sender: TObject);
  private
    procedure AbreQryContrib;
    procedure AbreQryContribRel;
    procedure AssociaContrib;
    procedure AssociaTodasContrib;
    procedure RemoveContrib;
    procedure RemoveTodasContrib;
    procedure AssociaBENEFXTAXA(idBeneficio, idContrib : Integer);
    procedure DesassociaBENEFXTAXA(idBeneficio: Integer;
      idContrib : String = '');
    procedure AssociaTodosBENEFXTAXA(idBeneficio : Integer);
    procedure TentaPosicionarQryNoIndex(qry: TwwQuery; index: Integer);
    function obtemIndexSelecionado(qry: TwwQuery; campoChave : String): Integer;
  public
    { Public declarations }
  end;

var
  frmAssociaBenefContrib: TfrmAssociaBenefContrib;

implementation

{$R *.DFM}

procedure TfrmAssociaBenefContrib.FormCreate(Sender: TObject);
begin
  inherited;
  qryBenef.Open;
end;

procedure TfrmAssociaBenefContrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryBenef.Close;
  qryContrib.Close;
end;

procedure TfrmAssociaBenefContrib.qryBenefAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AbreQryContrib;
  AbreQryContribRel;
end;

procedure TfrmAssociaBenefContrib.AbreQryContrib;
begin
  qryContrib.Close;
  qryContrib.ParamByName('IDBENEFICIO').AsString := qryBenef.FieldByName('IDBENEFICIO').AsString;
  qryContrib.Open;
end;

procedure TfrmAssociaBenefContrib.AbreQryContribRel;
begin
  qryContribRel.Close;
  qryContribRel.ParamByName('IDBENEFICIO').AsString := qryBenef.FieldByName('IDBENEFICIO').AsString;
  qryContribRel.Open;
end;

procedure TfrmAssociaBenefContrib.AssociaContrib;
var
    numeroLinhaQryContrib,
    numeroLinhaQryContribRel : Integer;
begin
      numeroLinhaQryContrib    := obtemIndexSelecionado(qryContrib, 'IDCONTRIBUICAO');//dbgrdPlanPatro.GetActiveRow;
      numeroLinhaQryContribRel := obtemIndexSelecionado(qryContribRel, 'IDCONTRIBUICAO');//dbgProvDesc.GetActiveRow;
      
      AssociaBENEFXTAXA(qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                        qryContrib.FieldByName('IDCONTRIBUICAO').AsInteger);
      AbreQryContrib;
      AbreQryContribRel;
      TentaPosicionarQryNoIndex(qryContrib, numeroLinhaQryContrib);
      TentaPosicionarQryNoIndex(qryContribRel, numeroLinhaQryContribRel);
end;

procedure TfrmAssociaBenefContrib.AssociaTodasContrib;
begin
      AssociaTodosBENEFXTAXA(qryBenef.FieldByName('IDBENEFICIO').AsInteger);
      AbreQryContrib;
      AbreQryContribRel;
end; 

procedure TfrmAssociaBenefContrib.RemoveContrib;
var
    numeroLinhaQryContrib,
    numeroLinhaQryContribRel : Integer;
begin
      numeroLinhaQryContrib    := obtemIndexSelecionado(qryContrib, 'IDCONTRIBUICAO');//dbgrdPlanPatro.GetActiveRow;
      numeroLinhaQryContribRel := obtemIndexSelecionado(qryContribRel, 'IDCONTRIBUICAO');//dbgProvDesc.GetActiveRow;

      DesassociaBENEFXTAXA(qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                           qryContribRel.FieldByName('IDCONTRIBUICAO').AsString);
      AbreQryContrib;
      AbreQryContribRel;
      TentaPosicionarQryNoIndex(qryContrib, numeroLinhaQryContrib);
      TentaPosicionarQryNoIndex(qryContribRel, numeroLinhaQryContribRel);
      dblklstContribRel.SetFocus;
end;

procedure TfrmAssociaBenefContrib.RemoveTodasContrib;
begin
      DesassociaBENEFXTAXA(qryBenef.FieldByName('IDBENEFICIO').AsInteger);
      AbreQryContrib;
      AbreQryContribRel;
end;

procedure TfrmAssociaBenefContrib.AssociaBENEFXTAXA(idBeneficio, idContrib : Integer);
var
    qryTemp : TwwQuery;
begin
       qryTemp := TwwQuery.Create(Application);
       qryTemp.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName;

       qryTemp.SQL.Text := 'INSERT INTO BENEFXTAXA (IDBENEFICIO, IDCONTRIBUICAO)' +#13+
                           'VALUES(' + IntToStr(idBeneficio) + ', ' +
                            IntToStr(idContrib) + ')';

       qryTemp.ExecSQL;

       qryTemp.Free;
end;

procedure TfrmAssociaBenefContrib.AssociaTodosBENEFXTAXA(idBeneficio : Integer);
var
    qryTemp : TwwQuery;
begin
       qryTemp := TwwQuery.Create(Application);
       qryTemp.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName;

       qryContrib.DisableControls;
       qryContrib.First;
       while not qryContrib.Eof do
       begin
         qryTemp.SQL.Text := 'INSERT INTO BENEFXTAXA (IDBENEFICIO, IDCONTRIBUICAO)' +#13+
                             'VALUES(' + IntToStr(idBeneficio) + ', ' +
                              qryContrib.FieldByName('IDCONTRIBUICAO').AsString + ')';

         qryTemp.ExecSQL;

         qryContrib.Next;
       end;

       qryContrib.EnableControls;
       qryTemp.Free;
end;

procedure TfrmAssociaBenefContrib.DesassociaBENEFXTAXA(idBeneficio : Integer; idContrib : String = '');
var
    qryTemp : TwwQuery;
begin
       qryTemp := TwwQuery.Create(Application);
       qryTemp.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName; 

       qryTemp.SQL.Text := 'DELETE FROM BENEFXTAXA' +#13+
                           'WHERE IDBENEFICIO = ' + IntToStr(idBeneficio);

       if idContrib <> '' then
          qryTemp.SQL.Text := qryTemp.SQL.Text +#13+
                              ' AND IDCONTRIBUICAO IN ('+ idContrib + ')';

      qryTemp.ExecSQL;

      qryTemp.Free;
end;

procedure TfrmAssociaBenefContrib.TentaPosicionarQryNoIndex(qry : TwwQuery; index : Integer);
var
    i : Integer;
begin
      qry.DisableControls;

      qry.First;

      i := 0;
      if index > 0 then
      while((i < index) and
            (not qry.EOF)) do
      begin
             qry.Next;
             Inc(i);
      end;

      qry.EnableControls;
end;


procedure TfrmAssociaBenefContrib.btnRemoveContribClick(Sender: TObject);
begin
  inherited;
  RemoveContrib;
end;

procedure TfrmAssociaBenefContrib.btnRemoveTodasContribClick(
  Sender: TObject);
begin
  inherited;
  RemoveTodasContrib;
end;

procedure TfrmAssociaBenefContrib.btnAdicionaContribClick(Sender: TObject);
begin
  inherited;
  AssociaContrib;
end;

procedure TfrmAssociaBenefContrib.btnAdicionaTodasContribClick(
  Sender: TObject);
begin
  inherited;
  AssociaTodasContrib; 
end;

function TfrmAssociaBenefContrib.obtemIndexSelecionado(qry : TwwQuery; campoChave : String) : Integer;
var
    i : Integer;
    chave : string;
begin
        chave := qry.FieldByName(campoChave).AsString;

        i := 0;
        qry.First;
        while Not qry.Eof do
        begin
              if qry.FieldByName(campoChave).AsString = chave then
                  Break;

              Inc(i);
              qry.Next;
        end;

        Result := i;
end;

end.
