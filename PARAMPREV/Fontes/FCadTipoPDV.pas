// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 10.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadTipoPDV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, Mask, DBCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadTipoPDV = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    qryEventoGerador: TwwQuery;
    dblkpcmbEvento: TwwDBLookupCombo;
    lblRgElegibilidade: TLabel;
    Label2: TLabel;
    lblRgResgate: TLabel;
    lblPrazo: TLabel;
    dblckcmbIdRegEleg: TwwDBLookupCombo;
    dblckcmbIdRegDataFinal: TwwDBLookupCombo;
    dblckcmbIdRegCalcResgate: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    procedure dblkpcmbEventoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCadTipoPDV: TfrmCadTipoPDV;

implementation

uses UDataBase, Usistema, UAdmPrev;

{$R *.DFM}

procedure TfrmCadTipoPDV.CmeCadastroFind(Sender: TObject);

begin
  if MontaSelect.RetornouValor then
  begin
     qry.Close;
     qry.ParamByName('IdPlanoPrev').Value  := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IdPlanoPrev').Value  := StrToInt(MontaSelect.ValoresChave[0]);
     qryDet.Open;

     qryEventoGerador.Close;
     qryEventoGerador.Open;

     qryRegra.Close;
     qryRegra.Open;

  end;
end;

procedure TfrmCadTipoPDV.CmeDetalheConfirma(Sender: TObject);
begin
  if not (qryDet.State in [DsEdit,DsInsert] )
  then Exit;

  qryDet.FieldbyName('Nome').AsString             := dblkpcmbEvento.Text;
  qryDet.FieldByName('IdPlanoPrev').AsInteger     := qry.FieldByName('IdPlanoPrev').AsInteger;
  qryDet.FieldByName('NOMEREGRAELEGIEV').AsString := dblckcmbIdRegEleg.Text;
  qryDet.FieldByName('NOMEREGRADTFIMEV').AsString := dblckcmbIdRegDataFinal.Text;
  qryDet.FieldByName('NOMEREGRARESGATE').AsString := dblckcmbIdRegCalcResgate.Text; 
  inherited;
end;

procedure TfrmCadTipoPDV.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  AplicaAlteracoes([QryDet]);
  
  Try
    If Not Sistema.GravaLogOperacoes(Self.Caption) Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

end;

procedure TfrmCadTipoPDV.dblkpcmbEventoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if qryEventoGerador.FieldbyName('FLGINTERNO').AsString <> 'PD'
  then begin
     dblckcmbIdRegEleg.Enabled        := False;
     dblckcmbIdRegCalcResgate.Enabled := False;

     dblckcmbIdRegEleg.Color           := clSilver;
     dblckcmbIdRegCalcResgate.Color    := clSilver;
  end
  else begin
     dblckcmbIdRegEleg.Enabled        := True;
     dblckcmbIdRegCalcResgate.Enabled := True;

     dblckcmbIdRegEleg.Color           := clWindow;
     dblckcmbIdRegCalcResgate.Color    := clWindow;
  end;

end;

procedure TfrmCadTipoPDV.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add(' PLANPREV.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO P '+ 
                         '                          WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)          +
                         '                          AND     PLP.IDPESSJUR = P.IDPESSOA )                   ');

end;

end.
