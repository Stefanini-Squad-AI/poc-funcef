{-------------------------------------------------------------------------------
 Data      : 03.04.2006
 Autor     : Antonio Marcos (amf)
 Pendência : 21830
 Descrição :  - Correção do valor pendente ao pressionar o botão adicionar
              - Correção do valor pendente ao pressionar o botão remover
---------------------------------------------------------------------------------
 Data      : 28.03.2006
 Autor     : Antonio Marcos (amf)
 Pendência : 21830
 Descrição : - Não exibe os produtos onde a quantidade pendente (qtdependente) = 0
             - Limpa o filtro ao sair da tela. Estava sempre considerando o último
               filtro passado para o cdsOC.
---------------------------------------------------------------------------------
 Data      : 27.03.2006
 Autor     : Antonio Marcos (amf)
 Pendência : 21830
 Descrição :  - Acerto do recebimento parcial de mercadorias
              - Acerto do valor da nota pelo somatório dos itens.
---------------------------------------------------------------------------------
 Data      : 12/01/2006
 Autor     : André tavares
 Pendência : 21243
 Descrição : Estava pegando o campo quantidade errado.
 --------------------------------------------------------------------------------
{-------------------------------------------------------------------------------
 Data      : 26/12/2005
 Autor     : André tavares
 Pendência : 21091
 Descrição : O campo quantidade esva sendo preenchido erradamente, tive que incluir mais uma coluna
 na query do sqlparam do FmtRecebMerc.spoc
 --------------------------------------------------------------------------------
{-------------------------------------------------------------------------------
 Rotina    :
 Data      : 10/06/2005
 Autor     : André tavares
 Pendência : 19288
 Descrição : filtrar pelo idplanoprev contabil
 --------------------------------------------------------------------------------
{-------------------------------------------------------------------------------
 Rotina    : btAdicionarClick
 Data      : 30/11/2004
 Autor     : Bruno Bastos
 Pendência : 18113
 Descrição : Atribuir os novos IdPlanoPrev, IdPatro e IdPrograma do CdsItemNota
             para o CdsOc. Os dois Cds's estão no form FrmMTRecebMerc.
 --------------------------------------------------------------------------------
 Rotina    : btAdicionarClick
 Data      : 09/06/2004
 Autor     : David Ayrolla
 Pendência : 16219
 Descrição : Ao tentar fazer recebimento do OC sem contação não liberado no RAD,
             exibir mensagem contendo no. do processo e da OC.
-------------------------------------------------------------------------------}
unit FMTOCxForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, FSairAjuda, uModulo,
  uMensErro, Db, DBClient, uCMClientDataSet, uCmSqlParams, wwdblook,
  Wwdatsrc, uCtrlRecebMerc, uCtrlPadroes;

type
  TFrmMTOCxForn = class(TfrmSairAjuda)
    grdOC: TwwDBGrid;
    grdOCAnted: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btAdicionar: TSpeedButton;
    btDeletar: TSpeedButton;
    sqlPlanPrevContab: TCMSqlParams;
    cdsPlanPrevContab: TCMClientDataSet;
    dblkPlanoPrev: TwwDBLookupCombo;
    Label1: TLabel;
    dsOC: TwwDataSource;
    spOC: TCMSqlParams;
    CdsOC: TCMClientDataSet;
    procedure btAdicionarClick(Sender: TObject);
    procedure btDeletarClick(Sender: TObject);
    procedure grdOCDblClick(Sender: TObject);
    procedure grdOCAntedDblClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure grdOCTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure grdOCAntedTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormCreate(Sender: TObject);
    procedure dblkPlanoPrevChange(Sender: TObject);
  private
    { Private declarations }
    RecebMerc       : TCtrlRecebMerc;
  public
    { Public declarations }
  end;

var
  FrmMTOCxForn: TFrmMTOCxForn;

implementation

{$R *.DFM}

Uses FMTRecebMerc;

procedure TFrmMTOCxForn.btAdicionarClick(Sender: TObject);
Var
   x : Integer;
begin
  If FrmMTRecebMerc.CdsOc.IsEmpty Then
     Exit;
    For x:= 0 To grdOC.SelectedList.Count - 1 Do
    Begin
       With FrmMTRecebMerc.CdsItemNota Do
          Begin

             if FrmMTRecebMerc.CdsOC.FieldByName('IDPROCESSO').AsInteger > 0 then
               if UpperCase( trim( FrmMTRecebMerc.CdsOC.FieldByName('FLGOK').AsString ) ) <> 'S' then
               begin
                 MsgDlg('Este recebimento ainda não foi autorizado no RAD. ' + #13#10 +
                        'No. do processo: ' + FrmMTRecebMerc.CdsOC.FieldByName('IDPROCESSO').AsString + #13#10 +
                        'No. da OC: ' + FrmMTRecebMerc.CdsOC.FieldByName('NUMOC').AsString,
                        'Atenção',MtWarning,[mbOK],0);
                 exit;
               end;

             Append;
             // Para poder ter valor para ser alterado na control
             FieldByName('IDITENSRECDEV').AsFloat      := FrmMTRecebMerc.CdsOC.FieldByName('IDITEMOC').AsFloat;
             FieldByName('NUMOC').AsInteger            := FrmMTRecebMerc.CdsOC.FieldByName('NumOC').AsInteger;
             FieldByName('CODARTIGO').AsString         := FrmMTRecebMerc.CdsOC.FieldByName('CodArtigo').AsString;
             FieldByName('DESCPROD').AsString          := FrmMTRecebMerc.CdsOC.FieldByName('DescProd').AsString;
             FieldByName('CODMEDIDA').AsString         := FrmMTRecebMerc.CdsOC.FieldByName('CodMedida').AsString;

             FrmMTRecebMerc.CdsItemNota.FieldByName('QTDEPENDENTE').AsFloat       := FrmMTRecebMerc.CdsOC.FieldByName('QTDEPENDENTE').AsFloat;

             FieldByName('QTDERECEBDEVOL').AsFloat     := FrmMTRecebMerc.CdsOC.FieldByName('QTDEPENDENTE').AsFloat;

             FieldByName('QTDEPEDIDA').AsFloat         := FrmMTRecebMerc.CdsOC.FieldByName('QTDEPEDIDA').AsFloat;

             FieldByName('QTDETOTAL').AsFloat          := FrmMTRecebMerc.CdsOC.FieldByName('Qtde').AsFloat;
             FieldByName('CODMEDIDA').AsString         := FrmMTRecebMerc.CdsOC.FieldByName('CodMedida').AsString;
             FieldByName('CODMEDORI').AsString         := FrmMTRecebMerc.CdsOC.FieldByName('CodMedida').AsString;
             FieldByName('VLRUNITARIO').AsFloat        := FrmMTRecebMerc.CdsOC.FieldByName('ValorUn').AsFloat;
             FieldByName('CODCOR').AsString            := FrmMTRecebMerc.CdsOC.FieldByName('CodCor').AsString;
             FieldByName('CODTAMANHO').AsString        := FrmMTRecebMerc.CdsOC.FieldByName('CodTamanho').AsString;
             FieldByName('CODALMOXARIFADO').AsInteger  := FrmMTRecebMerc.CdsOC.FieldByName('Codalmoxarifado').AsInteger;
             FieldByName('CODCUSTEIO').AsInteger       := FrmMTRecebMerc.CdsOC.FieldByName('CODCUSTEIO').AsInteger;
             FieldByName('UNIDNEGOC').AsInteger        := FrmMTRecebMerc.CdsOC.FieldByName('unidnegoc').AsInteger;
             FieldByName('CODCENTRORESPON').AsString   := FrmMTRecebMerc.CdsOC.FieldByName('codcentrorespon').AsString;
             FieldByName('IDPESSOA').AsInteger         := FrmMTRecebMerc.CdsOC.FieldByName('idpessoa').AsInteger;
             FieldByName('CODTIPRECDES').AsString      := FrmMTRecebMerc.CdsOC.FieldByName('CODTIPRECDES').AsString;
             FieldByName('RECPAG').AsString            := FrmMTRecebMerc.CdsOC.FieldByName('RECPAG').AsString;
             FieldByName('FLGDESTINO').AsString        := FrmMTRecebMerc.CdsOC.FieldByName('CUSTOESTOQUE').AsString;
             FieldByName('CODCENTROCUSTO').AsString    := FrmMTRecebMerc.CdsOC.FieldByName('CODCENTROCUSTO').AsString;
             FieldByName('CODFISCAL').AsString         := FrmMTRecebMerc.sCodFisc + FrmMTRecebMerc.CdsOC.FieldByName('CODFISCALPADRAO').AsString;
             FieldByName('IDITEMOC').AsInteger         := FrmMTRecebMerc.CdsOC.FieldByName('IDITEMOC').AsInteger;
             FieldByName('NUMSOLCOMPRA').AsInteger     := FrmMTRecebMerc.CdsOC.FieldByName('NUMSOLCOMPRA').AsInteger;

             FieldByName('PLANPREV').AsString          :=
               RecebMerc.GetNomePlanoPrev(FrmMTRecebMerc.CdsOC.FieldByName
               ('IDPLANOPREV').AsInteger);

             if (FrmMTRecebMerc.CdsOC.FieldByName('IDPLANOPREV').AsInteger = 0) then
               FieldByName('IDPLANOPREV').AsInteger := modulo.iIdPlanoPrev
             else
               FieldByName('IDPLANOPREV').AsInteger      :=  FrmMTRecebMerc.CdsOC.FieldByName('IDPLANOPREV').AsInteger;

             if(FrmMTRecebMerc.CdsOC.FieldByName('IDPATRO').AsInteger = 0) then
               FieldByName('IDPATRO').AsInteger          := Modulo.iIdPatro
             else
               FieldByName('IDPATRO').AsInteger          := FrmMTRecebMerc.CdsOC.FieldByName('IDPATRO').AsInteger;

             if(FrmMTRecebMerc.CdsOC.FieldByName('IDPROGRAMA').AsInteger = 0) then
               FieldByName('IDPROGRAMA').AsInteger       := Modulo.iIdPrograma
             else
               FieldByName('IDPROGRAMA').AsInteger       := FrmMTRecebMerc.CdsOC.FieldByName('IDPROGRAMA').AsInteger;

             If not FrmMTRecebMerc.CdsOC.FieldByName('IDRESERVAORCAMEN').IsNull Then
                FieldByName('IDRESERVAORCAMEN').AsInteger := FrmMTRecebMerc.CdsOC.FieldByName('IDRESERVAORCAMEN').AsInteger;

             If not FrmMTRecebMerc.CdsOC.FieldByName('IDPRODVARI').IsNull Then
                FieldByName('IDPRODVARI').AsInteger:= FrmMTRecebMerc.CdsOC.FieldByName('IDPRODVARI').AsInteger;
             Post;
         End;
      FrmMTRecebMerc.CdsOC.Delete;
    End;
end;

procedure TFrmMTOCxForn.btDeletarClick(Sender: TObject);
Var
   x : Integer;
begin
 inherited;
 If FrmMTRecebMerc.CdsItemNota.IsEmpty Then
    Exit;
  For x:= 0 To grdOCAnted.SelectedList.Count - 1 Do
     Begin
        With FrmMTRecebMerc.CdsOC Do
           Begin
               Append;
               FieldByName('NumOC').AsInteger            := FrmMTRecebMerc.CdsItemNota.FieldByName('NumOC').AsInteger;
               FieldByName('CodArtigo').AsString         := FrmMTRecebMerc.CdsItemNota.FieldByName('CodArtigo').AsString;
               FieldByName('DescProd').AsString          := FrmMTRecebMerc.CdsItemNota.FieldByName('DescProd').AsString;
               FieldByName('CodMedida').AsString         := FrmMTRecebMerc.CdsItemNota.FieldByName('CodMedida').AsString;

               FieldByName('IDITEMOC').AsInteger := FrmMTRecebMerc.CdsItemNota.FieldByName('IDITEMOC').AsInteger;

               FieldByName('QTDEPEDIDA').AsFloat := FrmMTRecebMerc.CdsItemNota.FieldByName('QTDEPEDIDA').AsFloat;

               FieldByName('QTDE').AsFloat       := FrmMTRecebMerc.CdsItemNota.FieldByName('QTDETOTAL').AsFloat;

               FrmMTRecebMerc.CdsOC.FieldByName('QTDEPENDENTE').AsFloat       := FrmMTRecebMerc.CdsItemNota.FieldByName('QTDEPENDENTE').AsFloat;


               FieldByName('CodMedida').AsString         := FrmMTRecebMerc.CdsItemNota.FieldByName('CodMedori').AsString;
               FieldByName('ValorUn').AsFloat            := FrmMTRecebMerc.CdsItemNota.FieldByName('VlrUnitario').AsFloat;
               FieldByName('CodCor').AsString            := FrmMTRecebMerc.CdsItemNota.FieldByName('CodCor').AsString;
               FieldByName('codalmoxarifado').AsInteger  := FrmMTRecebMerc.CdsItemNota.FieldByName('Codalmoxarifado').AsInteger;
               FieldByName('CODCUSTEIO').AsInteger       := FrmMTRecebMerc.CdsItemNota.FieldByName('CODCUSTEIO').AsInteger;
               FieldByName('unidnegoc').AsInteger        := FrmMTRecebMerc.CdsItemNota.FieldByName('unidnegoc').AsInteger;
               FieldByName('codcentrorespon').AsString   := FrmMTRecebMerc.CdsItemNota.FieldByName('codcentrorespon').AsString;
               FieldByName('IDPESSOA').AsInteger         := FrmMTRecebMerc.CdsItemNota.FieldByName('idpessoa').AsInteger;
               FieldByName('CODTIPRECDES').AsString      := FrmMTRecebMerc.CdsItemNota.FieldByName('CODTIPRECDES').AsString;
               FieldByName('RECPAG').AsString            := FrmMTRecebMerc.CdsItemNota.FieldByName('RECPAG').AsString;
               FieldByName('CUSTOESTOQUE').AsString      := FrmMTRecebMerc.CdsItemNota.FieldByName('FLGDESTINO').AsString;

               If Not FrmMTRecebMerc.CdsItemNota.FieldByName('IDRESERVAORCAMEN').IsNull Then
                  FieldByName('IDRESERVAORCAMEN').AsInteger := FrmMTRecebMerc.CdsItemNota.FieldByName('IDRESERVAORCAMEN').AsInteger;
               Post;
           End;
        FrmMTRecebMerc.CdsItemNota.Delete;
     End;
end;

procedure TFrmMTOCxForn.grdOCDblClick(Sender: TObject);
begin
  inherited;
  btAdicionar.Click;
end;

procedure TFrmMTOCxForn.grdOCAntedDblClick(Sender: TObject);
begin
  inherited;
  btDeletar.Click;
end;

procedure TFrmMTOCxForn.bbtnSairClick(Sender: TObject);
begin
  FrmMTRecebMerc.CdsOc.CancelUpdates;

  FrmMTRecebMerc.CdsOC.Filter := '';

  RecebMerc.Free;

  inherited;

end;




procedure TFrmMTOCxForn.grdOCTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
   FrmMTRecebMerc.CdsOC.IndexFieldNames := AFieldName;
end;




procedure TFrmMTOCxForn.grdOCAntedTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
   FrmMTRecebMerc.cdsItemNota.IndexFieldNames := AFieldName;
end;

procedure TFrmMTOCxForn.FormCreate(Sender: TObject);
begin
  inherited;
  cdsPlanPrevContab.Close;
  sqlPlanPrevContab.Open;

  RecebMerc := TCtrlRecebMerc.Create;
  RecebMerc.InitializeAs( Padroes );
end;

procedure TFrmMTOCxForn.dblkPlanoPrevChange(Sender: TObject);
begin
  inherited;
  FrmMTRecebMerc.CdsOC.Filtered := true;
  FrmMTRecebMerc.CdsOC.Filter := '';
  if (FrmMTRecebMerc.CdsOC.Active) and (trim(dblkPlanoPrev.text) <> '')then
    FrmMTRecebMerc.CdsOC.Filter := ' IDPLANOPREV = ' + dblkPlanoPrev.LookupValue;
end;

end.
