unit FConfigNF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls, wwdblook,
  CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, Menus,
  uCMTypes;

const
   MaxCampo = 28;
type
  TFrmConfigNF = class(TfrmCadastroCS)
    Label6: TLabel;
    QryDet: TwwQuery;
    DsDet: TwwDataSource;
    UpdDet: TUpdateSQL;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    MnuImprimir: TPopupMenu;
    MnuNotateste: TMenuItem;
    MnuMapa: TMenuItem;
    BtnImprime: TToolbarButton97;
    Panel1: TPanel;
    Label1: TLabel;
    dbedDescricao: TDBEdit;
    chkImpCond: TDBCheckBox;

    dbedLinDetInicial: TDBEdit;
    Label2: TLabel;
    dbedLinDetFinal: TDBEdit;
    Label3: TLabel;
    QryDetIDMODELONF: TFloatField;
    QryDetIDCOMPNF: TFloatField;
    QryDetCOLUNA: TFloatField;
    QryDetLINHA: TFloatField;
    QryDetTAMANHO: TFloatField;
    QryDetFLGALINHAMENTO: TStringField;
    QryDetFLGIMPOSTO: TStringField;
    QryDetFLGTOTALIZADA: TStringField;
    QryDetNUMMAXLINHAS: TFloatField;
    QryDetVALORDEFAULT: TFloatField;
    QryDetDESCRICAO: TStringField;
    Label4: TLabel;
    dbeNumLinhasNota: TDBEdit;
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    function RetornaDescricao(iLinha: Integer): String;
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigNF: TFrmConfigNF;

implementation

{$R *.DFM}

Uses uDataBase, uSistema, uMensErro;

procedure TFrmConfigNF.FormCreate(Sender: TObject);
begin
  inherited;
  Qry.CLose;
  Qry.ParamByName('IDModeloNF').AsFloat  := -1;
  Qry.ParamByName('IDPessoa').AsFloat := Sistema.IdEmpresa;
  Qry.Open;

  QryDet.Close;
  QryDet.ParamByName('IDModeloNF').AsFloat := -1;
  QryDet.Open;
end;

procedure TFrmConfigNF.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  BtnImprime.Enabled := not bbtnConfirmar.Enabled;
end;

procedure TFrmConfigNF.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       qry.CLose;
       qry.ParamByName('IDModeloNF').AsInteger    := StrToInt(MontaSelect.ValoresChave[0]);
       qry.ParamByName('IDPessoa').AsFloat := Sistema.IdEmpresa;
       qry.Open;

       qryDet.Close;
       qryDet.ParamByName('IDModeloNF').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
       qryDet.Open;
    end;
end;

procedure TFrmConfigNF.CmeCadastroInsert(Sender: TObject);
Var
  X: Integer;
begin
  inherited;
  Qry.FieldByName('FlgCondensado').AsString:='N';
  Qry.FieldByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
  Qry.FieldByName('LinDetInicial').AsFloat:=10;
  Qry.FieldByName('LinDetFinal').AsFloat:=20;

  QryDet.Close;
  QryDet.ParamByName('IDModeloNF').AsFloat:=-1;
  QryDet.Open;

  for X := 1 to MaxCampo do
  begin
    qryDet.Append;
    QryDet.FieldByName('IDCompNF').AsFloat:=X;

    QryDetDESCRICAO.AsString := RetornaDescricao(X);

    QryDet.FieldByName('Coluna').AsFloat:=0;
    QryDet.FieldByName('Linha').AsFloat:=0;
    QryDet.FieldByName('Tamanho').AsFloat:=0;
    QryDet.FieldByName('NumMaxLinhas').AsFloat:=1;
    QryDet.FieldByName('FlgAlinhamento').AsString:='D';
    QryDet.FieldByName('FlgImposto').AsString:='N';
    QryDet.FieldByName('FlgTotalizada').AsString:='N';
    qryDet.Post;
  end;
  qryDet.First;
end;

procedure TFrmConfigNF.CmeCadastroEdit(Sender: TObject);
var
   iX : Integer;
begin
   inherited;
   if (qry.State in [dsEdit]) then
    begin
       if (QryDet.RecordCount<>MaxCampo) then
        begin
           for iX:=1 to MaxCampo do
           begin
              if not(QryDet.Locate('IDCompNF',iX,[])) then
               begin
                  QryDet.Append;
                  QryDet.FieldByName('IDCompNF').AsFloat:=iX;
                  QryDetDESCRICAO.AsString := RetornaDescricao(iX);
                  QryDet.FieldByName('Coluna').AsFloat:=0;
                  QryDet.FieldByName('Linha').AsFloat:=0;
                  QryDet.FieldByName('Tamanho').AsFloat:=0;
                  QryDet.FieldByName('NumMaxLinhas').AsFloat:=1;
                  QryDet.FieldByName('FlgAlinhamento').AsString:='D';
                  QryDet.FieldByName('FlgImposto').AsString:='N';
                  QryDet.FieldByName('FlgTotalizada').AsString:='N';
                  QryDet.FieldByName('IDModeloNF').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
                  QryDet.Post;
               end;
           end;
        end;
    end;
end;

procedure TFrmConfigNF.CmeCadastroConfirma(Sender: TObject);
begin
  Case CmeCadastro.Operacao Of
    OpInserir: begin
                  Qry.Edit;
                  qry.FieldByName('IDModeloNF').AsFloat:=LeUltRegistro(nil,'ModNotaFiscal');
                  Qry.Post;
                  QryDet.First;
                  while not(QryDet.Eof) do
                  begin
                     QryDet.Edit;
                     QryDet.FieldByName('IDModeloNF').AsFloat:=qry.FieldByName('IDModeloNF').AsFloat;
                     QryDet.Post;
                     QryDet.Next;
                  end;
                  AplicaAlteracoes([qry, qryDet]);
               end;
    OpAlterar: AplicaAlteracoes([qry, qryDet]);
    OpApagar: begin
                 qryDet.First;
                 while not qryDet.EOF do
                   qryDet.Delete;
                 AplicaAlteracoes([qryDet, qry]);
              end
  else
    inherited;
  End;
end;

procedure TFrmConfigNF.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
if (Field.FieldName = 'DESCRICAO') and (not highlight) then
    ABrush.COLOR := $00DDFBDB;
end;

procedure TFrmConfigNF.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(dbedDescricao.Text)='' then
    begin
       MsgDlg('A Descrição não pode ser deixada em branco.','Erro',mtError,[mbOk], 0);
       dbedDescricao.SetFocus;
       Abort;
    end;

   if Trim(dbedLinDetInicial.Text)='' then
    begin
       MsgDlg('A Linha Detalhe Inicial não pode ser deixada em branco.','Erro',mtError,[mbOk], 0);
       dbedLinDetInicial.SetFocus;
       Abort;
    end;

   if Trim(dbedLinDetFinal.Text)='' then
    begin
       MsgDlg('A Linha Detalhe Final não pode ser deixada em branco.','Erro',mtError,[mbOk], 0);
       dbedLinDetFinal.SetFocus;
       Abort;
    end;

   if Trim(dbeNumLinhasNota.Text)='' then
    begin
       MsgDlg('O Número de Linhas da Nota não pode ser deixado em branco.','Erro',mtError,[mbOk], 0);
       dbeNumLinhasNota.SetFocus;
       Abort;
    end;

   inherited;

end;

procedure TFrmConfigNF.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   QryDet.Cancel;
end;

function TFrmConfigNF.RetornaDescricao(iLinha: Integer): String;
begin
   Result:='';
   //OBS: Sempre que acrescentar uma linha neste Case lembre-se de alterar o valor do MaxCampo lá
   //no começo do Fonte
   case iLinha of
      1: Result := 'Numero da Nota';
      2: Result := 'Natureza dos Serviços';
      3: Result := 'Data da Emissão';
      4: Result := 'Valor Total da Nota';
      5: Result := 'Número de Ordem';
      6: Result := 'Data de Vencimento';
      7: Result := 'Desconto';
      8: Result := 'Condição Especial';
      9: Result := 'Nome do Cliente';
     10: Result := 'Endereço';
     11: Result := 'Bairro/Distrito';
     12: Result := 'Município';
     13: Result := 'U.F.';
     14: Result := 'C.E.P.';
     15: Result := 'Praça de Pagamento';
     16: Result := 'CNPJ';
     17: Result := 'Inscrição Est./Mun.';
     18: Result := 'Valor por Extenso';
     19: Result := 'Descrição do Produto';
     20: Result := 'Unidade de Medida';
     21: Result := 'Quantidade';
     22: Result := 'Valor Unitário';
     23: Result := 'Valor Total';
     24: Result := 'Valor Total da Nota';
     25: Result := 'IRRF';
     26: Result := 'Valor Líquido';
     27: Result := 'Texto Descritivo do Imposto';
     28: Result := 'Prestação de Serviços';
   end;
end;

end.



