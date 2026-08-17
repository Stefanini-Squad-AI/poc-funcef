unit FParamContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, DBCtrls, wwdbedit, Wwdbspin, CmEventosCadastro,
  ImgList, TREdit, Grids, Wwdbigrd, Wwdbgrid;

type
  RParametros = record
  UsaTipodeDesembolso : boolean;
  end;
  TfrmParamContrato = class(TfrmCadastroCS)
    pcParametros: TPageControl;
    tsParametrosGerais: TTabSheet;
    dbcbUtilizaTRD: TDBCheckBox;
    dbcbEngItens: TDBCheckBox;
    edrNumDiasAvisoCorr: TDBRealEdit;
    Label1: TLabel;
    dbcbImpNFImpFis: TDBCheckBox;
    tbsImpostosNF: TTabSheet;
    pnlDisponiveis: TPanel;
    Panel2: TPanel;
    pnlSelecionados: TPanel;
    pnlTitDisponiveis: TPanel;
    pnlTitSelecionados: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    dbgDisponiveis: TwwDBGrid;
    dbgSelecionados: TwwDBGrid;
    qryDisponiveis: TwwQuery;
    dsDisponiveis: TwwDataSource;
    updDisponiveis: TUpdateSQL;
    qrySelecionados: TwwQuery;
    dsSelecionados: TwwDataSource;
    updSelecionados: TUpdateSQL;
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamContrato: TfrmParamContrato;

implementation

{$R *.DFM}
uses UDatabase, uSistema;

procedure TfrmParamContrato.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   if not(qry.Active) then Exit;
   if not(qry.IsEmpty) and not(qry.State in [dsInsert]) then
    begin
       sbtnInserir.Visible:=False;
       sbtnAlterar.Enabled:=True;
    end;
end;

procedure TfrmParamContrato.FormShow(Sender: TObject);
begin
   inherited;
   qry.open;
   if qry.IsEmpty then
    begin
       sbtnInserirClick(nil);
       qry.FieldByName('FLGENGLOBA').AsString:='N';
       qry.FieldByName('FLGTIPODESEMB').AsString:='N';
       qry.FieldByName('FLGNFIMPFISCAL').AsString:='N';
    end
   else
      CmeCadastroAtualizaBotoes(nil);

   pcParametros.ActivePageIndex:=0;

   qryDisponiveis.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryDisponiveis.Open;

   qrySelecionados.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qrySelecionados.Open;
end;

procedure TfrmParamContrato.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State in [dsInsert] then
    begin
       qry.FieldByName('IDPESSOA').AsFloat:=Sistema.IDEmpresa;
       qry.FieldByName('IDPARAMCONTRATO').AsFloat := LeUltRegistro(nil,'PARAMCONTRATO');
    end;

   AplicaAlteracoes([qry,qrySelecionados]);

   qryDisponiveis.Close;
   qryDisponiveis.Open;

   qrySelecionados.Close;
   qrySelecionados.Open;

   inherited;
end;

procedure TfrmParamContrato.btnAdicionaClick(Sender: TObject);
begin
   qrySelecionados.Append;
   qrySelecionados.FieldByName('Descricao').AsString:=
                   qryDisponiveis.FieldByName('Descricao').AsString;
   qrySelecionados.FieldByName('CodAlterador').AsFloat:=
                   qryDisponiveis.FieldByName('CodAlterador').AsFloat;
   qrySelecionados.FieldByName('IdPessoa').AsFloat:=Sistema.IdEmpresa;
   qrySelecionados.Post;
   qryDisponiveis.Delete;
end;

procedure TfrmParamContrato.BtnRemoveClick(Sender: TObject);
begin
   qryDisponiveis.Append;
   qryDisponiveis.FieldByName('Descricao').AsString:=
                  qrySelecionados.FieldByName('Descricao').AsString;
   qryDisponiveis.FieldByName('CodAlterador').AsFloat:=
                  qrySelecionados.FieldByName('CodAlterador').AsFloat;
   qryDisponiveis.FieldByName('IdPessoa').AsFloat:=Sistema.IdEmpresa;
   qryDisponiveis.Post;
   qrySelecionados.Delete;
end;

end.

