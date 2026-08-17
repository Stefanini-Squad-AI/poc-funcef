unit FCadVerbasNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, ComCtrls, StdCtrls, Db, DBTables, Wwquery,
  CmEventosCadastro, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, TB97, ExtCtrls, ImgList,
  Mask, wwdbedit, uObjetoVerba;

type
  TfrmCadVerbasNovo = class(TfrmCadastroDetalhe)
    pnlLeft: TPanel;
    trvArvore: TTreeView;
    imGrupos: TImageList;
    ListBox1: TListBox;
    Label4: TLabel;
    Label1: TLabel;
    DBEdtSaldo: TwwDBEdit;
    DBEdtPerc: TwwDBEdit;
    dsTipoContr: TDataSource;
    dsUnidade: TDataSource;
    qryPlano: TwwQuery;
    qryPlanoNOME: TStringField;
    qryPlanoIDPLANOPREV: TFloatField;
    qryTipoContr: TwwQuery;
    qryTipoContrIDTIPOCONTREMPTMO: TFloatField;
    qryTipoContrPERCENTUAL: TFloatField;
    qryTipoContrVALORRATEADO: TFloatField;
    qryTipoContrVALORUTILIZADO: TFloatField;
    qryTipoContrTCEDESCRICAO: TStringField;
    qryUnidade: TwwQuery;
    qryUnidadeIDUNIDCENTR: TFloatField;
    qryUnidadePERCENTUAL: TFloatField;
    qryUnidadeVALORRATEADO: TFloatField;
    qryUnidadeVALORUTILIZADO: TFloatField;
    qryUnidadeNOME: TStringField;
    chkZeraValor: TCheckBox;
    qryIDUNIDCENTR: TFloatField;
    qryPERCENTUAL: TFloatField;
    qryVALORRATEADO: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDTIPOCONTREMPTMO: TFloatField;
    lstUnidade: TListBox;
    DBEdtUtili: TwwDBEdit;
    Label2: TLabel;
    qryVALORUTILIZADO: TFloatField;
    dsPlano: TDataSource;
    qryPlanoVALORRATEADO: TFloatField;
    qryPlanoPERCENTUAL: TFloatField;
    qryTipoContrVALORDISPONIVEL: TCurrencyField;
    qryUnidadeVALORDISPONIVEL: TCurrencyField;
    qryVALORDISPONIVEL: TCurrencyField;
    DBEdtDispo: TwwDBEdit;
    Label3: TLabel;
    qryTipoContrIDPLANOPREV: TFloatField;
    edtReferencia: TEdit;
    Label5: TLabel;
    lstCodigos: TListBox;
    lstPlanos: TListBox;
    lstTipoContrato: TListBox;
    qryPlanoANOMES: TStringField;
    procedure trvArvoreChange(Sender: TObject; Node: TTreeNode);
    procedure trvArvoreExpanded(Sender: TObject; Node: TTreeNode);
    procedure trvArvoreCollapsed(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
    procedure trvArvoreClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    sIdPlano, sIdUnidade, sIdTipoContr : string;
    sTpSelec                     : string;
    fSaldoAnterior               : Currency;
    fDiferenca                   : Currency;

    ObjetoVerba                  : TObjetoVerba;
    
    procedure MontaTree;
    procedure GuardaValores(NoTree:TTreeNode);
    
  public
    { Public declarations }
  end;

var
  frmCadVerbasNovo: TfrmCadVerbasNovo;

implementation

uses UDataBase,
     USistema,       (* Sistema *)
     UMensErro,      (* MsgDlg *)
     UFuncoesEmptmo, (* LimpaParametros, CritDataEmptmo, ConverteVirg*)
     FProgresso,     (* FrmProgresso *)
     dBaseDados, uModulo, uVerificaPreenchimento,
     uDiasUteis;


{$R *.DFM}

procedure TfrmCadVerbasNovo.MontaTree;
var
   tNodPlano, tNodTipoContr, tNodUnidade : TTreeNode;
   sAno, sMes : String;
begin
   trvArvore.Items.Clear;
   lstCodigos.Clear;
   lstPlanos.Clear;
   lstTipoContrato.Clear;

   sAno := IntToStr(DiasUteis.ExtraiAno(Date));
   sMes := IntToStr(DiasUteis.ExtraiMes(Date));

   if Length(sMes) = 1 then sMes := '0'+ sMes;

   LimpaParametros(qryPlano);
   qryPlano.Open;
   qryPlano.First;

   edtReferencia.Text := qryPlanoANOMES.AsString;

   while not qryPlano.Eof do begin
      lstCodigos.Items.Add('P' + qryPlanoIDPLANOPREV.AsString);
      lstPlanos.Items.Add(CompletaInicio(qryPlanoIDPLANOPREV.AsString,'0',10));

      tNodPlano               := trvArvore.Items.Add(nil,
                                                     '(' + CompletaInicio(qryPlanoIDPLANOPREV.AsString,'0',10) +
                                                     ') - ' + qryPlanoNOME.AsString);
      tNodPlano.ImageIndex    := 0;
      tNodPlano.SelectedIndex := 0;
      sIdPlano                := qryPlanoIDPLANOPREV.AsString;

      LimpaParametros(qryTipoContr);
      qryTipoContr.ParamByName('PIDPLANOPREV').AsInteger := qryPlanoIDPLANOPREV.AsInteger;
      qryTipoContr.Open;

      while not qryTipoContr.Eof do begin
         lstTipoContrato.Items.Add(CompletaInicio(qryPlanoIDPLANOPREV.AsString,'0',10) +
                                   CompletaInicio(qryTipoContrIDTIPOCONTREMPTMO.AsString,'0',10));

         lstCodigos.Items.Add('T' + qryTipoContrIDTIPOCONTREMPTMO.AsString);
         tNodTipoContr               := trvArvore.Items.AddChild(tNodPlano,
                                        '(' + CompletaInicio(qryTipoContrIDTIPOCONTREMPTMO.AsString,'0',10) +
                                        ') - ' + qryTipoContrTCEDESCRICAO.AsString);
         tNodTipoContr.ImageIndex    := 2;
         tNodTipoContr.SelectedIndex := 2;

         LimpaParametros(qryUnidade);
         qryUnidade.ParamByName('PIDPLANOPREV').AsInteger       := qryPlanoIDPLANOPREV.AsInteger;
         qryUnidade.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryTipoContrIDTIPOCONTREMPTMO.AsInteger;
         qryUnidade.Open;

         if not qryUnidade.eof then begin
            while not qryUnidade.eof do begin
               lstCodigos.Items.Add('U' + qryUnidadeIDUNIDCENTR.AsString);
               lstUnidade.Items.Add(CompletaInicio(qryPlanoIDPLANOPREV.AsString,'0',10)           +
                                    CompletaInicio(qryTipoContrIDTIPOCONTREMPTMO.AsString,'0',10) +
                                    CompletaInicio(qryUnidadeIDUNIDCENTR.AsString,'0',10));
               tNodUnidade               := trvArvore.Items.AddChild(tNodTipoContr,'(' +
                                                           CompletaInicio(qryPlanoIDPLANOPREV.AsString,'0',5) +
                                                           CompletaInicio(qryTipoContrIDTIPOCONTREMPTMO.AsString,'0',5) +
                                                           CompletaInicio(qryUnidadeIDUNIDCENTR.AsString,'0',10) + ') - '+
                                                           qryUnidadeNOME.AsString);
               tNodUnidade.ImageIndex    := 1;
               tNodUnidade.SelectedIndex := 1;
               qryUnidade.Next;
            end;
         end;
         qryTipoContr.Next;
      end;
      qryPlano.Next;
   end;
   trvArvore.FullExpand;
end;



procedure TfrmCadVerbasNovo.trvArvoreChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;

   if trvArvore.Selected.AbsoluteIndex < 0 then begin
      Exit;
   end;

   GuardaValores(Node);
end;



procedure TfrmCadVerbasNovo.trvArvoreExpanded(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
   GuardaValores(Node);
end;



procedure TfrmCadVerbasNovo.trvArvoreCollapsed(Sender: TObject; Node: TTreeNode);
begin
  inherited;
   GuardaValores(Node);
end;



procedure TfrmCadVerbasNovo.GuardaValores(NoTree:TTreeNode);
var
     iNivel, ind, itam : integer;
     NoAnt : TTreeNode;
begin

   sTpSelec := Copy(lstCodigos.Items[NoTree.Level],1,1);
//   iTam     := Length(lstCodigos.Items[NoTree.Level]);
   iTam     := Length(lstCodigos.Items[NoTree.AbsoluteIndex]);
   if sTpSelec = 'P' then begin
      sIdPlano         := Copy(lstCodigos.Items[NoTree.AbsoluteIndex],2,10);
      sIdUnidade       := '';
      sIdTipoContr     := '';
   end else if sTpSelec = 'C' then begin
      sIdTipoContr     := Copy(lstCodigos.Items[NoTree.AbsoluteIndex],2,10);
      sIdUnidade       := '';
   end else if sTpSelec = 'U' then begin
      sIdUnidade       := Copy(lstCodigos.Items[NoTree.AbsoluteIndex],2,10);
      sIdTipoContr     := '';
   end;

   iNivel := NoTree.Level;

   if iNivel > 0 then begin
      NoAnt  := NoTree.GetPrev;

      While NoAnt.Level = iNivel do begin
         NoAnt  := NoAnt.GetPrev;
      end;

      while NoAnt.Level <= iNivel do begin
         if (NoAnt.Level <> iNivel) then begin
            ind      := NoAnt.AbsoluteIndex;
            sTpSelec := Copy(lstCodigos.Items[ind],1,1);
            iTam     := Length(lstCodigos.Items[ind]);

            if sTpSelec = 'T' then begin
               sIdTipoContr := Copy(lstCodigos.Items[ind],2,iTam-1);
            end else if sTpSelec = 'U' then begin
               sIdUnidade   := Copy(lstCodigos.Items[ind],2,iTam-1);
            end else if sTpSelec = 'P' then begin
               sIdPlano     := Copy(lstCodigos.Items[ind],2,iTam-1);
            end;
         end;
         if NoAnt.AbsoluteIndex <> 0 then
            NoAnt  := NoAnt.GetPrev
         else
            Break;
      end;
   end;
end;



procedure TfrmCadVerbasNovo.FormShow(Sender: TObject);
begin
  inherited;
   Repaint;
   Application.ProcessMessages;
   MontaTree;

end;


procedure TfrmCadVerbasNovo.trvArvoreClick(Sender: TObject);
var
   iIndice : Integer;
   sAno, sMes : String;

begin
  inherited;

   sAno := IntToStr(DiasUteis.ExtraiAno(Date));
   sMes := IntToStr(DiasUteis.ExtraiMes(Date));

   if Length(sMes) = 1 then sMes := '0'+ sMes;

   sTpSelec      := Copy(lstCodigos.Items[trvArvore.Selected.Level],1,1);

   sbtnAlterar.Enabled := ( sTpSelec = 'U' );

   if trvArvore.Selected.Level = 2 then
   begin
      sIdPlano               := Copy(trvArvore.Selected.Text,2,5);
      sIdTipoContr           := Copy(trvArvore.Selected.Text,7,5);
      sIdUnidade             := Copy(trvArvore.Selected.Text,12,10);
   end
   else if trvArvore.Selected.Level = 1 then
   begin
      iIndice := trvArvore.Selected.Index;
      sIdPlano               := Copy(lstTipoContrato.Items[iIndice],1,10);
      sIdTipoContr           := Copy(lstTipoContrato.Items[iIndice],11,10);
   end
   else if trvArvore.Selected.Level = 0 then
   begin
      iIndice   := trvArvore.Selected.Index;
      sIdPlano  := Copy(lstPlanos.Items[iIndice],1,10);
   end;



   if sTpSelec = 'U' then begin
      DBEdtSaldo.ReadOnly    := False;
      DBEdtSaldo.Color       := clWindow;
      DBEdtSaldo.DataSource  := ds;
      DBEdtPerc.DataSource   := ds;
      DBEdtUtili.DataSource  := ds;
      DBEdtDispo.DataSource  := ds;

      LimpaParametros(qry);
      qry.ParamByName('PIDPLANOPREV').AsInteger       := StrToInt(sIdPlano);
      qry.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(sIdTIpoContr);
      qry.ParamByName('PIDUNIDCENTR').AsInteger       := StrToInt(sIdUnidade);
      qry.Open;
   end else if sTpSelec = 'P' then begin
      LimpaParametros(qryPlano);
//      qryPlano.ParamByName('PANOMES').AsString        := sAno + sMes;
      qryPlano.ParamByName('PIDPLANOPREV').AsInteger  := StrToInt(sIdPlano);
      qryPlano.Open;

      DBEdtSaldo.ReadOnly    := True;
      DBEdtSaldo.Color       := clBtnFace;
      DBEdtSaldo.DataSource  := dsPlano;
      DBEdtPerc.DataSource   := dsPlano;
      DBEdtUtili.DataSource  := nil;
      DBEdtDispo.DataSource  := nil;
   end else if sTpSelec = 'T' then begin
      LimpaParametros(qryTipoContr);
      qryTipoContr.ParamByName('PIDPLANOPREV').AsInteger       := StrToInt(sIdPlano);
      qryTipoContr.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(sIdTipoContr);
      qryTipoContr.Open;

      DBEdtSaldo.ReadOnly    := True;
      DBEdtSaldo.Color       := clBtnFace;
      DBEdtSaldo.DataSource  := dsTipoContr;
      DBEdtPerc.DataSource   := dsTipoContr;
      DBEdtUtili.DataSource  := dsTipoContr;
      DBEdtDispo.DataSource  := dsTipoContr;
   end;
   Application.ProcessMessages;

end;



procedure TfrmCadVerbasNovo.bbtnConfirmarClick(Sender: TObject);
begin
   ObjetoVerba.RefazVerbaUnidade(StrToInt(sIdPlano),
                                 StrToInt(sIdTIpoContr),
                                 StrToInt(sIdUnidade),
                                 qryVALORRATEADO.AsCurrency,
                                 chkZeraValor.Checked);

   inherited;

end;



procedure TfrmCadVerbasNovo.qryCalcFields(DataSet: TDataSet);
begin
  inherited;
   DataSet.FieldByName('VALORDISPONIVEL').AsCurrency :=
                                DataSet.FieldByName('VALORRATEADO').AsCurrency -
                                DataSet.FieldByName('VALORUTILIZADO').AsCurrency;
end;

end.

