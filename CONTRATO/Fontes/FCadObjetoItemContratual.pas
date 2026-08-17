unit fCadObjetoItemContratual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, wwdbedit, TREdit, DBCtrls, Mask, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadObjetoItemContratual = class(TfrmCadMestreDetalheCS)
    dbLookupComboContrato: TwwDBLookupCombo;
    dbLookupComboItem: TwwDBLookupCombo;
    Label1: TLabel;
    Label3: TLabel;
    qryContrato: TwwQuery;
    qryObjeto: TwwQuery;
    qryItem: TwwQuery;
    dbLookupComboObjeto: TwwDBLookupCombo;
    Label5: TLabel;
    GroupBoxTolerancia: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    DBSpinToleranciaMaisObjeto: TwwDBSpinEdit;
    DBRadioGroupTipoTolerancia: TDBRadioGroup;
    DBSpinToleranciaMenosObjeto: TwwDBSpinEdit;
    GroupBoxPropriedades: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    dbLookupComboMoeda: TwwDBLookupCombo;
    dbLookupComboMedida: TwwDBLookupCombo;
    GroupBoxValores: TGroupBox;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBValorUnitarioObjeto: TDBRealEdit;
    DBValorTotalObjeto: TDBRealEdit;
    DBQtdeItem: TDBRealEdit;
    dbDataBase: TCMDateTimePicker;
    Label4: TLabel;
    tbsParcelas: TTabSheet;
    tbsRateio: TTabSheet;
    dbgrdRateio: TwwDBGrid;
    Panel1: TPanel;
    Panel3: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBDataInicioCobranca: TCMDateTimePicker;
    DBRadioGroupFrequencia: TDBRadioGroup;
    Label20: TLabel;
    Label21: TLabel;
    DBLookupComboCentroCusto: TwwDBLookupCombo;
    DBPercentualRateio: TDBRealEdit;
    lblNomeIntervalo: TLabel;
    Label28: TLabel;
    qryMoeda: TwwQuery;
    qryMedida: TwwQuery;
    qryAux: TwwQuery;
    qryCentroCusto: TwwQuery;
    qryRateio: TwwQuery;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    DBIntervalo: TDBRealEdit;
    DBNumeroParcelas: TDBRealEdit;
    DBNumeroMedicoes: TDBRealEdit;
    TabObs: TTabSheet;
    memObs: TDBMemo;
    qryIDCONTRATO: TFloatField;
    qryIDOBJETO: TFloatField;
    qryIDITEM: TFloatField;
    qryIDPESSOA: TFloatField;
    qryMOECODIGO: TFloatField;
    qryCODMEDIDA: TStringField;
    qryDATABASEITEM: TDateTimeField;
    qryQTDEITEM: TFloatField;
    qryVALORUNITARIOOBJETO: TFloatField;
    qryVALORTOTALOBJETO: TFloatField;
    qryTIPOTOLERANCIAOBJETO: TStringField;
    qryTOLERANCIAMAISOBJETO: TFloatField;
    qryTOLERANCIAMENOSOBJETO: TFloatField;
    qryNUMMEDICOES: TFloatField;
    qryNUMPARCELAS: TFloatField;
    qryFREQUENCIA: TStringField;
    qryINTERVALO: TFloatField;
    qryDATAINICIOCOBR: TDateTimeField;
    qryOBSERVACAO: TStringField;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    qryPlanoPrev: TwwQuery;
    qryPatro: TwwQuery;
    qryPrograma: TwwQuery;
    qryIDPATRO: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDPROGRAMA: TFloatField;
    qryContratoNOMECONTRATO: TStringField;
    qryContratoIDCONTRATO: TFloatField;
    qryContratoIDPESSOA: TFloatField;
    qryContratoDATABASECONTRATO: TDateTimeField;
    qryContratoFLGFIMCONTRATO: TStringField;
    qryRateioSUMPERCRATEIOCONTR: TFloatField;
    lblPrograma: TLabel;
    dblcPrograma: TwwDBLookupCombo;
    procedure DBQtdeItemExit(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure DBValorUnitarioObjetoExit(Sender: TObject);
    procedure dbLookupComboObjetoEnter(Sender: TObject);
    procedure dbLookupComboItemExit(Sender: TObject);
    procedure dbLookupComboContratoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbLookupComboContratoChange(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
  private
    deletou            : boolean;
    IdContrato         : integer;
    IdObjeto           : integer;
    IdItem             : integer;

    rTotalPercRateio   : real;
    rPercentual,rvalorantes : double;

    procedure SelecionaFilhos;
    function CalcPercentual: Real;
  public
    { Public declarations }
  end;

var
  frmCadObjetoItemContratual: TfrmCadObjetoItemContratual;

implementation

{$R *.DFM}

uses USistema, uMensErro, uDataBase, DBaseDados, fTelaAut, FCadAditamento;

procedure TfrmCadObjetoItemContratual.FormCreate(Sender: TObject);
begin
  inherited;
  deletou:=False;
  MontaSelect.Filtro.Add('(C.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                         'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+'))');

  pnlPlanoPatroC.Visible := Sistema.UsaPlanoPatro;

  qryPrograma.Close;
  qryPrograma.Open;

  qryPatro.Close;
  qryPatro.Open;

  qryPlanoPrev.Close;
  qryPlanoPrev.Open;

  rPercentual := 0;

  qryItem.Close;
  qryItem.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryItem.Open;

  qryObjeto.Close;
  qryObjeto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryObjeto.ParamByName('IDITEM').AsInteger   := -1;
  qryObjeto.Open;

  qryContrato.close;
  qryContrato.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
  qryContrato.ParamByName('IDUsuario').AsFloat:=Sistema.IDUsuario;
  qryContrato.Open;

  qry.close;
  qry.ParamByName('IDCONTRATO').AsInteger := 0;
  qry.ParamByName('IDOBJETO').AsInteger := 0;
  qry.ParamByName('IDITEM').AsInteger := 0;
  qry.Open;

  qryMoeda.Close;
  qryMoeda.Open;

  qryMedida.Close;
  qryMedida.Open;

  qryCentroCusto.close;
  qryCentroCusto.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
  qryCentroCusto.open;

  IdContrato     := 0;
  IdObjeto       := 0;
  IdItem         := 0;

  rTotalPercRateio:=0;
  SelecionaFilhos;
end;

procedure TfrmCadObjetoItemContratual.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   rPercentual := 0;

   IdContrato:=0;
   IdObjeto:=0;
   IdItem:=0;

   qry.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;

   SelecionaFilhos;

   dbLookupComboContrato.SetFocus;
end;

procedure  TfrmCadObjetoItemContratual.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var
   rCem,rvalor : Double;
begin
   Accept := False;
   rCem := 100;
   if trim(qry.FieldByName('IDCONTRATO').AsString) = '' then
    begin
       MsgDlg('Obrigatório preencher o Campo Contrato','Atenção',mtWarning,[mbOk],0);
       if dbLookupComboContrato.CanFocus then dbLookupComboContrato.SetFocus;
       Exit;
    end
   else
    if trim(qry.FieldByName('IDITEM').AsString) = '' then
     begin
        MsgDlg('Obrigatório preencher o Campo Item','Atenção',mtWarning,[mbOk],0);
        if dbLookupComboItem.CanFocus then dbLookupComboItem.SetFocus;
        Exit;
     end
    else
     if trim(qry.FieldByName('IDOBJETO').AsString) = '' then
      begin
         MsgDlg('Obrigatório preencher o Campo Serviço/Produto','Atenção',mtWarning,[mbOk],0);
         if dbLookupComboObjeto.CanFocus then dbLookupComboObjeto.SetFocus;
         Exit;
      end;
   rValor := 0;

   bbtnVoltarDet.click;

   qryDet.First;
   while not qryDet.EOF do
   begin
      rValor := rValor + qryDet.FieldByName('PERCRATEIOCONTR').AsFloat;
      qryDet.Next;
   end;

   if Format('%12.2f',[rvalor]) <> Format('%12.2f',[rCem]) then
    begin
       MsgDlg('Percentual Total não pode ser diferente de 100%','Atenção',mtInformation,[mbOk],0);
       if dbLookupComboContrato.CanFocus then dbLookupComboContrato.SetFocus;
       exit;
    end;

   if Sistema.UsaPlanoPatro then
    begin
       if trim(dblcPlanoPrevC.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
           if dblcPlanoPrevC.CanFocus then dblcPlanoPrevC.SetFocus;
           exit;
        end;

       if trim(dblcPatroC.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher a Patrocinadora','Erro',mtError,[mbOk],0);
           if dblcPatroC.CanFocus then dblcPatroC.SetFocus;
           exit;
        end;
    end;
   Accept := True;
end;

procedure TfrmCadObjetoItemContratual.CmeCadastroFind(Sender: TObject);
var
   stemp : string;
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       qry.close;
       qry.ParamByName('IDCONTRATO').AsString := MontaSelect.ValoresChave[0];
       qry.ParamByName('IDOBJETO').AsString := MontaSelect.ValoresChave[1];
       qry.ParamByName('IDITEM').AsString := MontaSelect.ValoresChave[2];
       qry.Open;

       idcontrato:= StrToInt(MontaSelect.ValoresChave[0]);
       idobjeto  := StrToInt(MontaSelect.ValoresChave[1]);
       iditem    := StrToInt(MontaSelect.ValoresChave[2]);

       qryObjeto.Close;
       qryObjeto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
       qryObjeto.ParamByName('IDITEM').AsInteger   := iditem;
       qryObjeto.Open;

       SelecionaFilhos;
       stemp := TRIM(qryItem.FieldByName('TIPOCOBRANCA').AsString);
       case stemp[1] of
          'P':case stemp[2]of
                'Q':GroupBoxTolerancia.Caption := 'Tolerância de Quantidades';
                'V':GroupBoxTolerancia.Caption := 'Tolerância de Valor';
              end;
          'E':case stemp[2]of
                'Q':GroupBoxTolerancia.Caption := 'Tolerância de Quantidades';
                'V':GroupBoxTolerancia.Caption := 'Tolerância de Valor';
              end;
          'A':case stemp[2]of
                'Q':GroupBoxTolerancia.Caption := 'Tolerância de Quantidades';
                'V':GroupBoxTolerancia.Caption := 'Tolerância de Valor';
              end;
       end;
    end;
end;

procedure TfrmCadObjetoItemContratual.CmeCadastroConfirma(Sender: TObject);
Var
   modificou : Boolean;
   x : integer;
begin
   if qryDet.State in [dsEdit,dsInsert] then
    begin
       qryDet.FieldByName('IDCONTRATO').AsInteger := qry.FieldByName('IDCONTRATO').AsInteger;
       qryDet.FieldByName('IDOBJETO').AsInteger   := qry.FieldByName('IDOBJETO').AsInteger;
       qryDet.FieldByName('IDITEM').AsInteger     := qry.FieldByName('IDITEM').AsInteger;
       qryDet.Post;
    end;

   if (qry.State in ([dsEdit])) or (qryDet.State in ([dsEdit])) then
    begin
       //Caso tenha ocorrido alguma alteracao em algum campo
       modificou := false;
       for x:=0 to qry.FieldCount - 1 do
          if qry.Fields[x].OldValue <> qry.Fields[x].NewValue then
           begin
              modificou := true;
              break;
           end;

       for x:=0 to qryDet.FieldCount - 1 do
          if qryDet.Fields[x].OldValue <> qryDet.Fields[x].NewValue then
           begin
              modificou := true;
              break;
           end;

       if modificou or deletou then
       //Só Contratos Cadastrados
        if qryContrato.FieldByName('FLGFIMCONTRATO').AsString = 'S' then
         try
            Application.CreateForm(TfrmCadAditamento, frmCadAditamento);
            frmCadAditamento.qryAditamento.Open;
            frmCadAditamento.dsAditamento.DataSet.Insert;
            frmCadAditamento.Caption := 'Aditamento do contrato '+qryContrato.FieldByName('NOMECONTRATO').AsString;
            frmCadAditamento.qryAditamento.FieldByName('IDCONTRATO').Asfloat;
            frmCadAditamento.idcontrato := qryContrato.FieldByName('IDCONTRATO').Asfloat;
            frmCadAditamento.ShowModal;
            deletou := False;
         finally
            frmCadAditamento.Free;
         end;
      end;
   try
      dtmBaseDados.dbBaseDados.ApplyUpdates([qry,qryDet]);
      IdContrato:=0;
      IdObjeto:=0;
      IdItem:=0;

      SelecionaFilhos;
   except
      rollbacktransacao;
   end;

   //inherited;
end;

Procedure TfrmCadObjetoItemContratual.CmeDetalheDelete(Sender: TObject);
begin
   if msgdlg('Confirma exclusão','Exclusão',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
       deletou := true;
       rTotalPercRateio:=rTotalPercRateio-qryDet.FieldByName('PERCRATEIOCONTR').AsFloat;
       inherited;
    end;
end;

Procedure TfrmCadObjetoItemContratual.CmeDetalheEdit(Sender: TObject);
begin
    case pgctrlDetalhe.ActivePage.PageIndex Of
       2 : begin
              rvalorantes := qryDet.FieldByName('PERCRATEIOCONTR').asFloat;
              inherited;
           end;
    else
        Inherited;
    end;
end;

procedure TfrmCadObjetoItemContratual.CmeDetalheConfirma(Sender: TObject);
var rCem,rvalor : Double;
begin
  rCem := 100;

  case pgctrlDetalhe.ActivePage.PageIndex of
     2 : begin
            if dsDet.State = dsInsert then
               rvalor := rPercentual+DBPercentualRateio.Value
            else
               rvalor := rPercentual-rvalorantes+DBPercentualRateio.Value;

            if dsDet.State in [dsEdit,dsInsert] Then
             begin
                if DBLookupComboCentroCusto.Text = '' then
                 begin
                    MsgDlg('Obrigatório preencher o Centro de Custo','Atenção',mtWarning,[mbOk],0);
                    DBLookupComboCentroCusto.SetFocus;
                    exit;
                 end;

                if (Sistema.UsaPlanoPatro) and (Trim(dblcPrograma.Text) = '') then
                 begin
                    MsgDlg('Obrigatório preencher o Programa','Erro',mtError,[mbOk],0);
                    dblcPrograma.SetFocus;
                    exit;
                 end;

                if Format('%12.2f',[rvalor]) > Format('%12.2f',[rCem])then
                 begin
                    MsgDlg('Percentual Total maior que 100%','Atenção',mtInformation,[mbOk],0);
                    DBLookupComboCentroCusto.SetFocus;
                    exit;
                 end
                else
                 begin
                    rTotalPercRateio:=rTotalPercRateio+qryDet.FieldByName('PERCRATEIOCONTR').AsFloat;
                    qryDet.FieldByName('NOMEPROG').AsString:=dblcPrograma.Text;
                    qryDet.FieldByName('IDCONTRATO').AsInteger:=qry.FieldByName('IDCONTRATO').AsInteger;
                    qryDet.FieldByName('IDOBJETO').AsInteger:=qry.FieldByName('IDOBJETO').AsInteger;
                    qryDet.FieldByName('IDITEM').AsInteger:=qry.FieldByName('IDITEM').AsInteger;
                    qryDet.FieldByName('IDEMPRESA').AsInteger:=Sistema.IdEmpresa;
                    qryDet.FieldByName('NOME').AsString:=DBLookupComboCentroCusto.Value;
                    inherited;
                 end;
             end
            else
             inherited
         end;
   else
       inherited;
   end;
end;

procedure TfrmCadObjetoItemContratual.SelecionaFilhos;
begin
   { Selecionando o Rateio... }
   qryDet.Close;
   qryDet.ParamByName('IDCONTRATO').AsInteger := IdContrato;
   qryDet.ParamByName('IDOBJETO').AsInteger   := IdObjeto;
   qryDet.ParamByName('IDITEM').AsInteger     := IdItem;
   qryDet.Open;
   { Selecionando o Rateio...somatorio }
   qryRateio.Close;
   qryRateio.ParamByName('IDCONTRATO').AsInteger := IdContrato;
   qryRateio.ParamByName('IDOBJETO').AsInteger   := IdObjeto;
   qryRateio.ParamByName('IDITEM').AsInteger     := IdItem;
   qryRateio.Open;

   rTotalPercRateio:=0;
   if not(qryRateio.IsEmpty) then rTotalPercRateio:=CalcPercentual;
end;

procedure TfrmCadObjetoItemContratual.DBQtdeItemExit(Sender: TObject);
begin
   inherited;
   qry.FieldByName('VALORTOTALOBJETO').AsFloat := DBQtdeItem.Value * DBValorUnitarioObjeto.Value;
   DBValorTotalObjeto.Value :=qry.FieldByName('VALORTOTALOBJETO').AsFloat;
end;


Procedure TfrmCadObjetoItemContratual.CmeDetalheInsert(Sender: TObject);
var
   rCem : Double;
begin
    rCem := 100;
    case pgctrlDetalhe.ActivePage.PageIndex of
       2 : begin
              rPercentual:=CalcPercentual;
              if Format('%12.2f',[rPercentual]) > Format('%12.2f',[rCem])Then
               begin
                  MsgDlg('Excedido o Percentual de 100%','Atenção',mtInformation,[mbOk],0);
                  bbtnVoltarDet.Click;
               end
              else
               begin
                  inherited;
                  qryDet.FieldByName('PERCRATEIOCONTR').AsFloat:=100-rTotalPercRateio;
               end;
           end;
    else
       inherited;
    end;
end;

procedure TfrmCadObjetoItemContratual.sbtnAlterarClick(
  Sender: TObject);
begin
   if qryContrato.FieldByName('FLGFIMCONTRATO').AsString = 'E' then
     begin
        ShowMessage('Contrato Encerrado. Estes dados não podem ser alterados');
        Exit;
     end
   else
     begin
        inherited;
        qryRateio.Close;
        qryRateio.Open;
     end;
end;

procedure TfrmCadObjetoItemContratual.DBValorUnitarioObjetoExit(
  Sender: TObject);
begin
   inherited;
   qry.FieldByName('VALORTOTALOBJETO').AsFloat := DBQtdeItem.Value * DBValorUnitarioObjeto.Value;
   DBValorTotalObjeto.Value :=qry.FieldByName('VALORTOTALOBJETO').AsFloat;
end;

procedure TfrmCadObjetoItemContratual.dbLookupComboObjetoEnter(
  Sender: TObject);
begin
  inherited;
  qryObjeto.Close;
  qryObjeto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  if not qry.FieldByName('IDITEM').isNull then
     qryObjeto.ParamByName('IDITEM').AsInteger := StrToInt(dbLookupComboItem.LookUpValue)
  else
     qryObjeto.ParamByName('IDITEM').AsInteger := -1;
  qryObjeto.Open;
end;

procedure TfrmCadObjetoItemContratual.dbLookupComboItemExit(
  Sender: TObject);
var
   sTemp :  string;
begin
   inherited;
   sTemp := TRIM(qryItem.FieldByName('TIPOCOBRANCA').AsString);
   case sTemp[1] of
   'P':case sTemp[2]of
       'Q':GroupBoxTolerancia.Caption := 'Tolerância de Quantidades';
       'V':GroupBoxTolerancia.Caption := 'Tolerância de Valor';
       end;
   'E':case sTemp[2]of
       'Q':GroupBoxTolerancia.Caption := 'Tolerância de Quantidades';
       'V':GroupBoxTolerancia.Caption := 'Tolerância de Valor';
       end;
   'A':case sTemp[2]of
       'Q':GroupBoxTolerancia.Caption := 'Tolerância de Quantidades';
       'V':GroupBoxTolerancia.Caption := 'Tolerância de Valor';
       end;
   end;
end;

procedure TfrmCadObjetoItemContratual.dbLookupComboContratoExit(
  Sender: TObject);
begin
   inherited;
   dbDataBase.Text := QryContrato.FieldByName('DATABASECONTRATO').AsString;
end;

procedure TfrmCadObjetoItemContratual.sbtnInsDetClick(Sender: TObject);
begin
   inherited;
   qryDet.FieldByName('IDCONTRATO').AsInteger    := qry.FieldByName('IDCONTRATO').AsInteger;
   qryDet.FieldByName('IDOBJETO').AsInteger      := qry.FieldByName('IDOBJETO').AsInteger;
   qryDet.FieldByName('IDITEM').AsInteger        := qry.FieldByName('IDITEM').AsInteger;
   qryDet.FieldByName('IDEMPRESA').AsInteger     := Sistema.IdEmpresa;
end;

procedure TfrmCadObjetoItemContratual.sbtnAltDetClick(Sender: TObject);
begin
   rTotalPercRateio:=rTotalPercRateio-qryDet.FieldByName('PERCRATEIOCONTR').AsFloat;
   inherited;
end;

procedure TfrmCadObjetoItemContratual.dbLookupComboContratoChange(
  Sender: TObject);
begin
   inherited;
   if (Trim(dbLookupComboContrato.Text)<>'') and (qry.State in [dsInsert]) then
    begin
       qryAux.Close;
       qryAux.Sql.Clear;
       qryAux.Sql.Add('SELECT DATABASECONTRATO FROM CONTRATOCONTR WHERE (IDPESSOA = '+
                      IntToStr(Sistema.IdEmpresa)+') AND '+
                      ' (IDCONTRATO = '+ dbLookupComboContrato.LookupValue+')');
       qryAux.Open;
       qry.FieldByName('DATABASEITEM').AsString := qryAux.FieldByName('DATABASECONTRATO').AsString;
    end;
end;

function TfrmCadObjetoItemContratual.CalcPercentual: Real;
begin
   Result := 0;
   qryDet.DisableControls;
   qryDet.First;
   while not qryDet.EOF Do
   begin
      Result := Result + qryDet.FieldByName('PERCRATEIOCONTR').AsFloat;
      qryDet.Next;
   end;
   qryDet.EnableControls;
   qryDet.First;
end;

procedure TfrmCadObjetoItemContratual.CmeCadastroDelete(Sender: TObject);
begin
   StartTransacao;
   try
      qryDet.First;
      while not(qryDet.Eof) do qryDet.Delete;
      qryDet.ApplyUpdates;
      CommitTransacao;
      inherited;
   except
      RollBackTransacao;
      raise;
   end;
end;

end.
