unit FHabilitacaoBenefINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroPai, CmEventosCadastro, ImgList, Db, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, MontaSelect, Mask, DBCtrls, DBTables, Wwquery, UDataBase, dBaseDados, uMensErro;

type
  TFrmHabilitacaoBenefINSS = class(TfrmCadastroPai)
    MS: TMontaSelect;
    Label1: TLabel;
    Label2: TLabel;
    DbrBenefIdentificado: TDBRadioGroup;
    EdtIdentificador: TDBEdit;
    EdtDescSitHabINSS: TDBEdit;
    qryHabitaBenef: TwwQuery;
    dsHabitaBenef: TwwDataSource;
    updHabitaBenef: TUpdateSQL;
    qry: TUpdateSQL;
    qryAux: TwwQuery;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HabilitaBtn;
    procedure DesabilitaBtn;
    procedure HabilitaCampos;

  private
    { Private declarations }
    FlgIncluir, FlgExcluir, FlgEditar : Boolean;
  public
    { Public declarations }
  end;

var
  FrmHabilitacaoBenefINSS: TFrmHabilitacaoBenefINSS;

implementation

{$R *.DFM}

procedure TFrmHabilitacaoBenefINSS.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MS.Executar;

  if MS.RetornouValor then begin
    qryHabitaBenef.Close;
    qryHabitaBenef.ParamByName('IDSITHAB').asInteger :=  StrToInt(MS.ValoresChave[0]);
    qryHabitaBenef.Open;
    HabilitaBtn;
    EdtDescSitHabINSS.Enabled := False;
    DbrBenefIdentificado.Enabled := False;
  end else begin
    DesabilitaBtn;
  end;

end;

procedure TFrmHabilitacaoBenefINSS.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  FlgIncluir := False;
  FlgExcluir := False;
  FlgEditar  := True;

  qryHabitaBenef.Edit;
  HabilitaCampos;
end;

procedure TFrmHabilitacaoBenefINSS.sbtnInserirClick(Sender: TObject);
begin
  inherited;
      FlgIncluir := True;
      FlgExcluir := False;
      FlgEditar  := False;
      HabilitaCampos;
      qryHabitaBenef.Close;
      qryHabitaBenef.ParamByName('IDSITHAB').asInteger := 0;
      qryHabitaBenef.Open;
      qryHabitaBenef.Insert;
      qryHabitaBenef.FieldByname('FLGHABILITACAOINSS').asInteger := 0;

end;

procedure TFrmHabilitacaoBenefINSS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryHabitaBenef.CancelUpdates;
  DesabilitaBtn;
  qryHabitaBenef.Close;
  sbtnInserir.Down := False;
  sbtnAlterar.Down := False;
  sbtnApagar.Down := False;
  sbtnProcurar.Down := False;
end;

procedure TFrmHabilitacaoBenefINSS.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

 If (FlgIncluir) or (FlgEditar) then begin
    if not (EdtDescSitHabINSS.text = '') then begin
      sbtnInserir.Down := False;
      sbtnAlterar.Down := False;
      FlgIncluir := False;
      FlgEditar := False;
    end else begin
      MsgDlg('É necessário informar a descrição da situação para habilitação de benefícios do INSS.', 'Informação', mtInformation, [mbOk], 0);
      Exit;
    end;
 end;

 AplicaAlteracoes([qryHabitaBenef]);
 qryHabitaBenef.Close;

 DesabilitaBtn;
 sbtnApagar.Down := False;
 FlgExcluir := False;
end;

procedure TFrmHabilitacaoBenefINSS.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  FlgIncluir := False;
  FlgExcluir := True;
  FlgEditar  := False;

  If MsgDlg('Deseja excluir o registro selecionado ?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  Then begin
    qryHabitaBenef.Delete;
    sbtnAlterar.Down := False;
    FlgExcluir := False;
  end;
  
end;

procedure TFrmHabilitacaoBenefINSS.FormCreate(Sender: TObject);
begin
  inherited;
  qryHabitaBenef.Close;
  qryHabitaBenef.ParamByName('IDSITHAB').asInteger := 0;
  qryHabitaBenef.Open;
end;

Procedure TFrmHabilitacaoBenefINSS.DesabilitaBtn;
begin
sbtnApagar.Enabled := False;
sbtnAlterar.Enabled := False;
sbtnInserir.Enabled := True;
end;

Procedure TFrmHabilitacaoBenefINSS.HabilitaBtn;
begin
    sbtnApagar.Enabled := True;
    sbtnAlterar.Enabled := True;
    sbtnInserir.Enabled := False;
end;

Procedure TFrmHabilitacaoBenefINSS.HabilitaCampos;
begin
    EdtDescSitHabINSS.Enabled := True;
    DbrBenefIdentificado.Enabled := True;
end;

end.
