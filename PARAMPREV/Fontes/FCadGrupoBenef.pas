// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 10.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadGrupoBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadGrupoBenef = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label2: TLabel;
    dbedDescricao: TDBEdit;
    dbedCodigo: TDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryBeneficio: TwwQuery;
    qryPlano: TwwQuery;
    Label3: TLabel;
    Label4: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    rgrpPrincipal: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryPlanoAfterScroll(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
  private
    { Private declarations }


  public
    { Public declarations }
  end;

var
  frmCadGrupoBenef: TfrmCadGrupoBenef;

implementation

uses UMensErro, UDataBase, DAPrev, Usistema, UAdmPrev;

{$R *.DFM}

procedure TfrmCadGrupoBenef.FormActivate(Sender: TObject);
begin
  inherited;
  
  qry.Close;
  qry.ParamByName('IdGrupoBenef').Value  := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdGrupoBenef').Value  := 0;
  qryDet.Open;

  
  qryPlano.Close;
  qryPlano.Open;
  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
  qryBeneficio.Open;

end;

procedure TfrmCadGrupoBenef.CmeCadastroFind(Sender: TObject);
var iIdGrupoBenef : longint;
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     iIdGrupoBenef := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Close;
     qry.ParamByName('IdGrupoBenef').Value  := iIdGrupoBenef;
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IdGrupoBenef').Value  := iIdGrupoBenef;
     qryDet.Open;
  end;
end;

procedure TfrmCadGrupoBenef.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  
  qry.FieldByName('IdGrupoBenef').AsInteger    := LeUltRegistro(qry,'GRUPOBENEF');
  

  qryDet.Close;
  qryDet.ParamByName('IdGrupoBenef').Value     := qry.FieldByName('IdGrupoBenef').AsInteger;
  qryDet.Open;
end;

procedure TfrmCadGrupoBenef.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   try
      AplicaAlteracoes([qryDet])
   except
      raise;
   end;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
end;

procedure TfrmCadGrupoBenef.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   qryDet.FieldByName('IdGrupoBenef').AsInteger := qry.FieldbyName('IdGrupoBenef').AsInteger;
   qryDet.FieldByName('flgPrincipal').AsInteger := 0;
end;

procedure TfrmCadGrupoBenef.dblkpcmbPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
  qryBeneficio.Open;
end;

procedure TfrmCadGrupoBenef.qryPlanoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
  qryBeneficio.Open;

end;

procedure TfrmCadGrupoBenef.qryDetBeforePost(DataSet: TDataSet);
begin
  if qryDet.State in [dsInsert, dsEdit] 
  then begin
      if Trim(dblkpcmbPlano.Text) = ''
      then begin
         MsgDlg('Preencha o Plano Previdenciário.', 'Erro',mtError,[mbOk, mbHelp],0);
         Exit;
      end;

      if Trim(dblkpcmbBeneficio.Text) = ''
      then begin
         MsgDlg('Preencha o Benefício.', 'Erro',mtError,[mbOk, mbHelp],0);
         Exit;
      end;
  end;

  inherited;

  qryDet.FieldByName('NomeBeneficio').AsString := qryBeneficio.FieldByName('Nome').AsString;
  qryDet.FieldByName('NomePlano').AsString     := qryPlano.FieldByName('Nome').AsString;

end;

procedure TfrmCadGrupoBenef.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('GRUPOBENEF.IDFUNDACAO = '+IntToStr(iIdFundacao)); 
end;

procedure TfrmCadGrupoBenef.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldbyName('IDFUNDACAO').AsInteger := iIdFundacao;
end;

end.

