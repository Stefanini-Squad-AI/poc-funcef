unit FCadModeloNF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, DBCtrls, Mask, uCmSqlParams, uCtrlNotaFiscal;

type
  TfrmCadModeloNF = class(TFrmCadastroMT)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbedDescricao: TDBEdit;
    chkImpCond: TDBCheckBox;
    dbedLinDetInicial: TDBEdit;
    dbedLinDetFinal: TDBEdit;
    dbeNumLinhasNota: TDBEdit;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    spTeste: TCMSqlParams;
    cdsDet: TCMClientDataSet;
    dsDet: TDataSource;
    BtnImprime: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
  private
    { Private declarations }
    CtrlNotaFiscal : TCtrlNotaFiscal;
  public
    { Public declarations }
  end;

var
  frmCadModeloNF: TfrmCadModeloNF;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadModeloNF.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlNotaFiscal:=TCtrlNotaFiscal.Create;
   CtrlNotaFiscal.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlNotaFiscal.cdsModeloNF:=Cds;
   CtrlNotaFiscal.cdsCompNF:=cdsDet;

   Cds.Data:=CtrlNotaFiscal.ListModeloNF(-1,-1); //vazio
   cdsDet.Data:=CtrlNotaFiscal.ListCompNF(-1); //vazio
end;

procedure TfrmCadModeloNF.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   Cds.FieldByName('FlgCondensado').AsString:='N';
   Cds.FieldByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   Cds.FieldByName('LinDetInicial').AsFloat:=10;
   Cds.FieldByName('LinDetFinal').AsFloat:=20;
   cdsDet.EmptyDataSet;
   cdsDet.First;
   CtrlNotaFiscal.GeraLinhasCompNF;
end;

procedure TfrmCadModeloNF.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if (cdsDet.State in [dsEdit]) then
       CtrlNotaFiscal.GeraLinhasCompNFFaltantes(Cds.FieldByName('IDModeloNF').AsFloat);
end;

procedure TfrmCadModeloNF.CmeCadastroDelete(Sender: TObject);
begin
   inherited;
   if not(CtrlNotaFiscal.ExcluiModNF) then
      MsgDlg(CtrlNotaFiscal.MessageInfo,'Atenção',mtWarning,[mbOk],0);
end;

procedure TfrmCadModeloNF.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       cds.Close;
       cds.Data:=CtrlNotaFiscal.ListModeloNF(Sistema.IdEmpresa,StrToFloat(MontaSelect.ValoresChave[0]));

       cdsDet.Close;
       cdsDet.Data:=CtrlNotaFiscal.ListCompNF(StrToFloat(MontaSelect.ValoresChave[0]));
    end;
end;

procedure TfrmCadModeloNF.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   if (Trim(dbedDescricao.Text)='') then
    begin
       MsgDlg('A Descrição não pode ser deixada em branco.','Erro',mtError,[mbOk], 0);
       dbedDescricao.SetFocus;
       Accept:=False;
    end;

   if (Trim(dbedLinDetInicial.Text)='') then
    begin
       MsgDlg('A Linha Detalhe Inicial não pode ser deixada em branco.','Erro',mtError,[mbOk], 0);
       dbedLinDetInicial.SetFocus;
       Accept:=False;
    end;

   if (Trim(dbedLinDetFinal.Text)='') then
    begin
       MsgDlg('A Linha Detalhe Final não pode ser deixada em branco.','Erro',mtError,[mbOk], 0);
       dbedLinDetFinal.SetFocus;
       Accept:=False;
    end;

   if (Trim(dbeNumLinhasNota.Text)='') then
    begin
       MsgDlg('O Número de Linhas da Nota não pode ser deixado em branco.','Erro',mtError,[mbOk], 0);
       dbeNumLinhasNota.SetFocus;
       Accept:=False;
    end;
end;

procedure TfrmCadModeloNF.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   if (Cds.State in [dsInsert,dsEdit]) then
      if not(CtrlNotaFiscal.AplicaAtualModNF) then
             MsgDlg(CtrlNotaFiscal.MessageInfo,'Atenção',mtWarning,[mbOk],0);
end;

procedure TfrmCadModeloNF.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   cdsDet.Cancel;
end;

procedure TfrmCadModeloNF.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   BtnImprime.Enabled:=False;
end;

procedure TfrmCadModeloNF.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   if (Field.FieldName = 'DESCRICAO') and (not highlight) then
       ABrush.COLOR := $00DDFBDB;
end;

end.
