unit FCadHstContribuicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  Mask, wwdbedit, Spin, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmCadHstContribuicao = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    MontaSelect1: TMontaSelect;
    qrydescricao: TwwQuery;
    qryDetTipodeDescrio: TStringField;
    Label12: TLabel;
    lblcobranca: TLabel;
    qrycobracarne: TwwQuery;
    qryDetTipodeCobrana: TStringField;
    qrymotivo: TwwQuery;
    Label15: TLabel;
    DBText9: TDBText;
    qryATIVO: TStringField;
    qryMATRICULA: TStringField;
    qryINSCRICAONUMERO: TFloatField;
    qryCONTRIBUICAO: TStringField;
    qryPARTICIPANTE: TStringField;
    qryPLANOPREVIDENCIARIO: TStringField;
    qryPATROCINADORA: TStringField;
    qryPLANOASSISTENCIAL: TStringField;
    qryDEPENDENTE: TStringField;
    qryIDPLANASS: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDPESSJUR: TFloatField;
    qryIDTITULAR: TFloatField;
    qryIDDEPENDENTE: TFloatField;
    qryIDCONTASS: TFloatField;
    qryFLGATIVO: TFloatField;
    qryFLGCOBCARNE: TFloatField;
    qryDetMES: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetVALORESPERADO: TFloatField;
    qryDetVALORRECEBIDO: TFloatField;
    qryDetDATAPREVISAO: TDateTimeField;
    qryDetIDPAGADOR: TFloatField;
    qryDetSITRECEBIMENTO: TStringField;
    qryDetNOME: TStringField;
    qryDetTITULAR: TStringField;
    qryDetIDPLANASS: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetIDDEPENDENTE: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetIDCONTASS: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetFLGCOBCARNE: TFloatField;
    qryDetDESCRICAO: TStringField;
    qryDetIDTIPO: TStringField;
    sbtnBaixaDet: TSpeedButton;
    Label16: TLabel;
    shapenaoenv: TShape;
    lblnaoenv: TLabel;
    shapnaorec: TShape;
    lblnaorec: TLabel;
    qryDetTIPO: TStringField;
    pnlaltinsert: TPanel;
    SpeedButton1: TSpeedButton;
    Label14: TLabel;
    GroupBox4: TGroupBox;
    cmbtipo: TComboBox;
    GroupBox3: TGroupBox;
    cmbmotivo: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    spinanocob: TSpinEdit;
    cmbmescob: TComboBox;
    grpMesAnoRef: TGroupBox;
    Label10: TLabel;
    spinanoref: TSpinEdit;
    cmbmesref: TComboBox;
    dbedpagador: TDBEdit;
    grpcobranca: TRadioGroup;
    pnlbaixa: TPanel;
    grplancamento: TGroupBox;
    lblmesref: TLabel;
    dblblmesref: TDBText;
    lblmescob: TLabel;
    dblblmescob: TDBText;
    lbltipo: TLabel;
    dblbltipo: TDBText;
    lblmotivo: TLabel;
    dblblmotivo: TDBText;
    detlbldtprevista: TLabel;
    dblbldataprevista: TDBText;
    lblvaloresperado: TLabel;
    dblblvaloresperado: TDBText;
    detlblpagador: TLabel;
    dblblpagador: TDBText;
    lblcobranca1: TLabel;
    dblblcobranca: TDBText;
    grpbaixa: TGroupBox;
    lblvalorrecebido: TLabel;
    lbldtpagamento: TLabel;
    dbvalorrecebido: TDBEdit;
    dbdtpagamento: TCMDateTimePicker;
    qryDetMotivoBaixa: TStringField;
    qryDetDATA: TDateTimeField;
    qryDetIDLOTE: TFloatField;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    DBText10: TDBText;
    dbdtPrevisao: TCMDateTimePicker;
    dbedEsperado: TwwDBEdit;
    qryDetNUMRECEBIMENTO: TFloatField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure speeddescricaoClick(Sender: TObject);
    procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField;
              State: TGridDrawState; Highlight: Boolean; AFont: TFont;
              ABrush: TBrush);
    procedure qryBeforeOpen(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    Procedure InsertFiario(Ms:String);
    procedure ApresentaLegenda (stat: boolean);

  public
    { Public declarations }
end;

var
  frmCadHstContribuicao: TfrmCadHstContribuicao;
  nomeTitular: String;
  idPagador, idTitular: integer;
  ano, mes,dia: word;
  baixa,clicoumestre, clicoudet,deletou: boolean;

implementation

uses UAdmPrev, UMensErro, UDataBase, DAPrev, USincronismo, UAdmASS, USistema;

{$R *.DFM}

const
  ctMotivoPadrao = 4; //motivo padrão na inclusão

Procedure TFrmCadHstContribuicao.InsertFiario(Ms:String);
begin
  (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
  FazerInsertFiario(qryIDTITULAR.AsInteger,qryIDDEPENDENTE.AsInteger,
                    Sistema.IdUsuario, Sistema.IdModulo,
                    'PREPARO MANUAL DE CONTRIBUIÇÃO - '+Ms+' '+qryCONTRIBUICAO.AsString+'  '+
                    cmbMesRef.Items[cmbMesRef.ItemIndex]+'/'+IntToStr(spinAnoRef.Value)+'  '+
                    'Valor: '+FormatFloat('0.00',qryDetVALORESPERADO.AsFloat)+'  '+
                    'Motivo: '+qryMotivo.FieldByName('DESCRICAO').AsString);
end;

procedure TFrmCadHstContribuicao.CmeCadastroConfirma(Sender: TObject);
begin
   if baixa then
   begin
     if (dbvalorrecebido.text = '') and (dbdtpagamento.text = '') then
         bbtncancelardetclick(self)
     else
     begin
        if not clicoudet then
        begin
          bbtnokdetclick(self);
          bbtncancelardetclick(self);
          clicoudet := false;
        end;

        try
        begin
          qrydet.ApplyUpdates;
          qrydet.CommitUpdates;
          qrydet.close;
          qrydet.open;
          ApresentaLegenda(true);
          pnlbaixa.SendToBack;
          pnlcontrolesDet.SendToBack;
          dbgrddet.BringtoFront;
          clicoudet := false;
          clicoumestre := false;
        end
        except
          bbtncancelarclick(self);
        end;
     end;
   end
   else
   begin
     if ((pnlcontrolesdet.Showing) and
        (qrydet.state in [dsinsert,dsedit,dsbrowse])) or deletou then
     begin
        if ((dbedesperado.Text = '')   and
            (cmbmotivo.Text = '')      and
            (dbdtPrevisao.Text = ''))  then
             bbtncancelardetclick(self)
        else
        begin
           bbtnokdetclick(self);
           bbtncancelardetclick(self);
           try
           begin
             qrydet.ApplyUpdates;
             qrydet.CommitUpdates;
             qrydet.close;
             qrydet.open;
             ApresentaLegenda (true);
             deletou := false;
           end
           except
             bbtncancelarclick(self);
           end;
        end;
     end
     else
     begin
        bbtnconfirmar.enabled := true;
        bbtncancelar.enabled := true;
     end;
   end;
end;                   

procedure TFrmCadHstContribuicao.CmeDetalheDelete(Sender: TObject);
var
  escolha: integer;
begin
     escolha := MsgDlg('Deseja realmente excluir este registro ?','Informação',
                       mtInformation,[mbYes,mbNo,mbHelp],0);
     case escolha of
         mrYes{++6}: inherited;//yes
         mrNo {++7}: begin//No
                      end;
     end;
end;

procedure TFrmCadHstContribuicao.CmeDetalheConfirma(Sender: TObject);
var anomesref, anomescob, pagador, sanomescobranca: string;
    mesref, mescob,escolha: integer;
    cTipoEnvPrev: char;
begin
  if baixa then
  begin
     if (dbvalorrecebido.text = '') then
     begin
        MsgDlg('Digite o valor.','Erro',mterror,[mbyes,mbno],0);
        Screen.Cursor := -2;
        dbvalorrecebido.setfocus;
        abort;
     end;

     if (qrydet.fieldbyname('valorrecebido').asfloat < 0) then
     begin
         MsgDlg('Não pode ser valor negativo.','Erro',mterror,[mbyes,mbno],0);
         Screen.Cursor := -2;
         dbvalorrecebido.setfocus;
         abort;
     end;

     if (qrydet.fieldbyname('Valorrecebido').asfloat = 0 ) then
     begin
        MsgDlg('Valor não pode ser igual a zero.','Erro',mterror,[mbyes,mbno],0);
        Screen.Cursor := -2;
        dbvalorrecebido.setfocus;
        abort;
     end;

     if (dbdtpagamento.text= '') then
     begin
         MsgDlg('Digite a Date de Pagamento','Erro',mterror,[mbyes,mbno],0);
         Screen.Cursor := -2;
         dbdtpagamento.setfocus;
         abort;
     end;

     if (qrydet.fieldbyname('valorrecebido').asFloat <> qrydet.fieldbyname('valoresperado').asFloat) or
        (qrydet.fieldbyname('Data').AsDateTime > qrydet.fieldbyname('dataprevisao').asDatetime) then
     begin
         escolha := MsgDlg('Dados informados indicam uma baixa com divergência(valor recebido diferente'+
                           ' do valor devido e/ou data de pagamento posterior à data prevista). Confirma os dados?',
                           ' Confirmação', mterror,[mbyes,mbno],0);
         case escolha of
         6: begin
               qrydet.edit;
               clicoudet := true;
             end;
         7: begin//no
                clicoudet := false;
                Screen.Cursor := crArrow;
                abort;
              end;
         end;//fim do case
         qrydet.fieldbyname('sitrecebimento').asinteger := 3;
     end
     else
        qrydet.fieldbyname('sitrecebimento').asinteger := 2;

     qrydet.post;
     Apresentalegenda(true);
     pnlbaixa.SendToBack;
     pnlcontrolesdet.SendToBack;
     dbgrddet.BringtoFront;
  end
  else
  begin
     if (qrydet.state in [dsinsert]) and not baixa then
     begin
        mesref := cmbmesref.ItemIndex + 1;
        if mesref <= 9 then
           anomesref := spinanoref.Text+'/0'+inttostr(mesref)
        else
           anomesref := spinanoref.Text+'/'+inttostr(mesref);

        mescob := cmbmescob.itemindex + 1;
        if mescob <= 9 then
           anomescob := spinanocob.text+'/0'+inttostr(mescob)
        else
           anomescob := spinanocob.text+'/'+inttostr(mescob);

        if grpcobranca.ItemIndex = 0 then
        begin
           if VerificaFechamento(qrydet.fieldbyname('idpessjur').asinteger,cteIdModuloCCP,
                                 anomescob, 'E', ctipoEnvPrev) then
           begin
              sanomescobranca := ProximoMesAberto(anomescob,
                                                  qrydet.fieldbyname('idpessjur').asinteger,
                                                  cteIdModuloCCP,
                                                  'E');
              msgdlg('O envio do CCP para a patrocinadora '+ qry.fieldbyname('patrocinadora').asString +
                     ' já foi executado e encerrado para o mês '+anomescob+'. Altere-o para '+
                     sanomescobranca+' (próximo mês em aberto para cobrança).',
                     'Informação',mtinformation,[mbyes,mbNo],0);
              abort;
           end;
        end;

        ApresentaLegenda (true);
        qrydet.fieldbyname('SEQPROPOSTA').asInteger := 1;
        qrydet.fieldbyname('idplanass').asinteger := qry.fieldbyname('idplanass').asinteger;
        qrydet.fieldbyname('idplanoprev').asinteger := qry.fieldbyname('idplanoprev').asinteger;
        qrydet.fieldbyname('idpessjur').asinteger := qry.fieldbyname('idpessjur').asinteger;
        qrydet.fieldbyname('idtitular').asinteger := qry.fieldbyname('idtitular').asinteger;
        qrydet.fieldbyname('iddependente').asinteger := qry.fieldbyname('iddependente').asinteger;
        qrydet.fieldbyname('IDCONTASS').asinteger := qry.fieldbyname('idcontass').asinteger;

        if (cmbmotivo.Text = '') then
        begin
          MsgDlg('Digite o Motivo.','Erro',mtError,[mbOk,mbHelp],0);
          cmbmotivo.setfocus;
          abort;
        end
        else
          qrydet.fieldbyname('IDMOTIVO').asInteger := qryMotivo.fieldbyname('idmotivo').asinteger;

        qrydet.fieldbyname('SITRECEBIMENTO').asinteger := 0;
        qrydet.fieldbyname('MES').asstring := anomesref;
        qrydet.fieldbyname('MESCOBRANCA').asString := anomescob;

        if (dbedesperado.text = '') then
        begin
          MsgDlg('Digite o Valor.','Erro',mtError,[mbOk,mbHelp],0);
          dbedesperado.setfocus;
          abort;
        end;

        if (qrydet.fieldbyname('valoresperado').asFloat < 0.0) then
        begin
          MsgDlg('Valor não pode ser negativo.','Erro',mtError,[mbOk,mbHelp],0);
          dbedesperado.setfocus;
          abort;
        end;

        if (qrydet.fieldbyname('valoresperado').asFloat = 0.0) then
        begin
          MsgDlg('Valor não pode igual a zero.','Erro',mtError,[mbOk,mbHelp],0);
          dbedesperado.setfocus;
          abort;
        end;

        qrydet.fieldbyname('IDPAGADOR').Asinteger := idPagador;

        if grpcobranca.ItemIndex = 0 then
          qrydet.fieldbyname('flgcobcarne').asinteger := 0
        else
          qrydet.fieldbyname('flgcobcarne').asinteger := 1;

        if (dbdtprevisao.Text = '') then
        begin
          MsgDlg('Digite a data de previsão.','Erro',mtError,[mbOk,mbHelp],0);
          dbdtprevisao.SetFocus;
          abort;
        end;

        if (cmbtipo.text = '') then
        begin
          MsgDlg('Digite o Tipo de Cobrança.','Erro',mtError,[mbOk,mbHelp],0);
          cmbtipo.setfocus;
          abort;
        end
        else
        begin
          qrydet.fieldbyname('idtipo').asString:=cmbtipo.Items.Strings[cmbtipo.ItemIndex];
          if qrydet.fieldbyname('idtipo').asString = 'N' then
            qrydet.fieldbyname('tipo').asString := 'Normal'
          else
            if qrydet.fieldbyname('idtipo').asString = 'A' then
              qrydet.fieldbyname('tipo').asString:='Atraso'
            else
              if qrydet.fieldbyname('idtipo').asString = 'D' then
                qrydet.fieldbyname('tipo').asString:='Devolução';

        end;

        if (dbedpagador.text = '') then
        begin
          MsgDlg('Digite o responsável pelo pagamento.','Erro',mtError,[mbOk,mbHelp],0);
          dbedpagador.setfocus;
          abort;
        end;
     end
     else
       if qrydet.state = dsedit then
       begin
          pagador := trim(qrydet.fieldbyname('nome').asString);

          if (cmbtipo.text = '') then
          begin
             MsgDlg('Digite o Tipo de Cobrança.','Erro',mtError,[mbOk,mbHelp],0);
             cmbtipo.setfocus;
             abort;
          end;

          if (dbedesperado.text = '') then
          begin
             Msgdlg('Digite o Valor.','Erro',mterror,[mbok,mbhelp],0);
             dbedesperado.setfocus;
             abort;
          end;

          if (qrydet.fieldbyname('valoresperado').asFloat < 0) then
          begin
             Msgdlg('Valor não pode ser negativo.','Erro',mterror,[mbok,mbhelp],0);
             dbedesperado.setfocus;
             abort;
          end;

          if (qrydet.fieldbyname('valoresperado').asFloat = 0) then
          begin
             Msgdlg('Valor não pode ser zero.','Erro',mterror,[mbok,mbhelp],0);
             dbedesperado.setfocus;
             abort;
          end;

          if (dbdtprevisao.text = '') then
          begin
             Msgdlg('Digite a Data de Previsão.','Erro',mterror,[mbok,mbno],0);
             dbdtprevisao.setfocus;
             abort;
          end;

          qrydet.fieldbyname('IDPAGADOR').Asinteger := idPagador;

          if grpcobranca.ItemIndex = 0 then
            qrydet.fieldbyname('flgcobcarne').asinteger := 0
          else
            qrydet.fieldbyname('flgcobcarne').asinteger := 1;

          ApresentaLegenda (true);
       end;

       inherited;
       sbtnBaixaDet.enabled := true;
  end;
end;

procedure TfrmCadHstContribuicao.CmeCadastroFind(Sender: TObject);
begin
  if montaselect.RetornouValor then
  begin
    lblcobranca.visible := true;
    qry.close;
    qry.parambyname('idplanass').asinteger:=StrToIntDef(montaselect.ValoresChave[2],0);
    qry.parambyname('idplanoprev').asinteger:=StrToIntDef(montaselect.ValoresChave[3],0);
    qry.parambyname('idpessjur').asinteger:=StrToIntDef(montaselect.valoreschave[4],0);
    qry.parambyname('idtitular').asinteger:=StrToIntDef(montaselect.valoreschave[5],0);
    qry.ParamByName('iddependente').asinteger:=StrToIntDef(montaselect.valoreschave[6],0);
    qry.open;
    nomeTitular := qry.fieldbyname('PARTICIPANTE').asString;

    qrydet.close;
    qrydet.parambyname('SEQPROPOSTA').asinteger := StrToIntDef(montaselect.ValoresChave[0],0);
    qrydet.parambyname('IDCONTASS').asinteger := StrToIntDef(montaselect.ValoresChave[1],0);
    qrydet.parambyname('IDPLANASS').asinteger := StrToIntDef(montaselect.ValoresChave[2],0);
    qrydet.parambyname('IDPLANOPREV').asinteger := StrToIntDef(montaselect.ValoresChave[3],0);
    qrydet.parambyname('IDPESSJUR').asinteger := StrToIntDef(montaselect.valoreschave[4],0);
    idTitular := StrToIntDef(montaselect.valoreschave[5],0);
    qrydet.parambyname('IDTITULAR').asinteger := idTitular;
    qrydet.parambyname('IDDEPENDENTE').asinteger := StrToIntDef(montaselect.valoreschave[6],0);
    qrydet.open;

    qrydescricao.open;
    qrycobracarne.Open;
  end;
  ApresentaLegenda(true);
end;

procedure TfrmCadHstContribuicao.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if qrydet.state= dsinsert then
  begin
    cmbmesref.enabled := true;
    cmbmesref.Text := cmbmesref.items.Strings[mes-1];
    cmbmesref.itemindex := mes - 1;

    spinanoref.enabled := true;
    spinanoref.Text := inttostr(ano);

    cmbmescob.enabled := true;
    cmbmescob.text := cmbmescob.items.Strings[mes-1];
    cmbmescob.itemindex := mes - 1;

    qrydet.fieldbyname('nome').asString := nomeTitular;
    idPagador := idTitular;

    spinanocob.enabled := true;
    spinanocob.Text := inttostr(ano);

    cmbmotivo.Enabled := true;
    cmbtipo.enabled := true;
    ApresentaLegenda(false);
    baixa := false;
  end;
end;

procedure TfrmCadHstContribuicao.CmeDetalheEdit(Sender: TObject);
var
  anomesref, anomescob, mesref, mescob: string;
begin
  inherited;
  if (qrydet.state = dsedit) and
     (sbtnaltdet.Down) then
  begin
    anomesref := qrydet.fieldbyname('mes').asstring;
    anomescob := qrydet.fieldbyname('mescobranca').asstring;
    spinanoref.text := copy(anomesref,1,4);
    spinanoref.Enabled := false;

    mesref := copy(anomesref,6,2);
    cmbmesref.text := cmbmesref.Items.Strings[StrToIntDef(mesref,0)-1];
    cmbmesref.Enabled := false;

    spinanocob.text := copy(anomescob,1,4);
    spinanocob.Enabled := false;

    mescob := copy(anomescob,6,2);
    cmbmescob.Text := cmbmescob.items.Strings[StrToIntDef(mescob,0)-1];
    cmbmescob.Enabled := false;

    grpcobranca.ItemIndex := qrydet.fieldbyname('flgcobcarne').asInteger;
    cmbmotivo.Enabled := false;

    if qrydet.fieldbyname('idtipo').asString = 'N' then
       cmbtipo.text:= 'Normal'
    else
      if qrydet.fieldbyname('idtipo').asString = 'A' then
        cmbtipo.text:= 'Atraso'
      else
        if qrydet.fieldbyname('idtipo').AsString = 'D' then
          cmbtipo.text:= 'Devolução';

    cmbtipo.Enabled := false;
    idPagador := qrydet.fieldbyname('IDPAGADOR').asInteger;
    ApresentaLegenda(false);
    baixa := false;
  end;
end;

procedure TfrmCadHstContribuicao.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  montaSelect1.executar;

  if montaSelect1.RetornouValor then
  begin
     qryDet.fieldbyname('nome').asString := montaSelect1.ValoresChave[0];
     idPagador := StrToIntDef(montaSelect1.ValoresChave[1],0);
  end;
end;

procedure TfrmCadHstContribuicao.FormShow(Sender: TObject);
begin
  inherited;
  decodedate(now,ano,mes,dia);
  spinanoref.Text := inttostr(ano);
  cmbmesref.text := cmbmesref.items.Strings[mes-1];
  cmbmesref.itemindex := mes - 1;
  cmbmescob.itemindex := mes - 1;
  spinanocob.text := inttostr(ano);
  cmbmescob.text := cmbmescob.items.Strings[mes-1];
  qrymotivo.open;
  qrymotivo.first;
  cmbmotivo.text := qrymotivo.fieldbyname('descricao').asString;
  cmbtipo.text := cmbtipo.Items.Strings[0];
  cmbtipo.itemindex := 0;
  pnlbaixa.SendToBack;
  clicoudet := false;
  clicoumestre := false;
  pnlaltinsert.SendToBack;
end;

procedure TfrmCadHstContribuicao.sbtnAltDetClick(Sender: TObject);
begin
  if qrydet.fieldbyname('sitrecebimento').asinteger = 1 then
  begin
    MsgDlg('Contribuição não poderá ser alterada, pois já foi enviada para cobrança.','Erro',mtError,[mbOk,mbHelp],0);
    bbtncancelardetclick(self);
    exit;
  end;

  baixa := false;
  inherited;
  pnlbaixa.sendtoback;
  pnlaltinsert.bringtofront;
  sbtnBaixaDet.enabled := false;
end;

procedure TfrmCadHstContribuicao.speeddescricaoClick(Sender: TObject);
//var escolha: integer;
begin
  inherited;

  bbtnconfirmar.enabled:=true;
  bbtncancelar.enabled:=true;
  apresentalegenda(false);
  if qrydet.fieldbyname('sitrecebimento').asinteger = 0 then
  begin
     MsgDlg('Esta contribuição não pode ser baixada porque não foi enviada para cobrança.','Erro',mtError,[mbOk,mbHelp],0);
     exit;
  end
  else
  begin
     baixa := true;
     pnlControlesDet.SendToBack;
     dbgrdDet.SendToBack;
     pnlbaixa.BringToFront;
     tb97Detalhe.visible:=true;
     CmeDetalhe.Edit(Self);
  end;
end;

procedure TfrmCadHstContribuicao.dbgrdDetCalcCellColors(Sender: TObject;
          Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
          ABrush: TBrush);
var i: byte;
begin
  inherited;
  if qrydet.isempty then
    i := 0
  else
    i := qrydet.FieldByName('sitrecebimento').AsInteger;

  case i of
    0: begin
          ABrush.Color := clwindow;
          AFont.Color  := clWindowText;
          if highlight then
          begin
            ABrush.Color := clwindow;
            AFont.Color  := clWindowText;
          end;
        end;
    1: begin
          ABrush.Color := clYellow;
          AFont.Color  := clWindowText;
          if highlight then
          begin
            ABrush.Color := clYellow;
            AFont.Color  := clwindowtext;
          end;
        end
   else begin
          ABrush.Color := clLime;
          AFont.Color  := clWindowText;
          if highlight then
          begin
            ABrush.Color := clLime;
            AFont.Color  := clwindowtext;
          end;
        end;
  end;//case
end;

procedure TfrmCadHstContribuicao.qryBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if qry.fieldbyname('flgcobcarne').asinteger = 0 then
     lblcobranca.caption := 'Folha'
  else
     lblcobranca.caption := 'Banco';
end;

procedure TfrmCadHstContribuicao.sbtnInsDetClick(Sender: TObject);
var escolha: integer;
begin
  if qry.fieldbyname('flgativo').asinteger = 1 then
  begin
     escolha:= MsgDlg('A contribuição '+ qry.fieldbyname('contribuicao').asString +' está ativa e é calculada normalmente'+
                      ' pelo sistema, podendo ser alterada e/ou excluída caso seja feito novo cálculo (opção Contribuição/Preparo/Automático). Deseja inserir assim mesmo ?','Aviso',
                      mtconfirmation,[mbyes,mbno,mbHelp],0);
     case escolha of
         mrYes{6} :
           begin
             baixa := false;
             inherited;
             pnlbaixa.sendtoback;
             pnlaltinsert.bringtofront;
             sbtnBaixaDet.enabled := false;
             qryDet.FieldByName('NUMRECEBIMENTO').AsInteger := LeUltRegistro(nil, 'HSTCONTRIBASS');
           end;
         mrNo{7}  :
           sbtnInsDet.Down := false;
     end;
  end;
end;

procedure TfrmCadHstContribuicao.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  sbtnBaixaDet.enabled := true;
  ApresentaLegenda(true);
end;

procedure TfrmCadHstContribuicao.ApresentaLegenda(stat: boolean);
begin
   shapenaoenv.visible := stat;
   lblnaoenv.visible := stat;
   shapnaorec.visible := stat;
   lblnaorec.visible := stat;
   Label16.visible := stat;
end;

procedure TfrmCadHstContribuicao.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   if qrydet.IsEmpty then
     sbtnBaixaDet.enabled := false
   else
     sbtnBaixaDet.enabled := (sbtnalterar.Down);
end;

procedure TfrmCadHstContribuicao.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   ApresentaLegenda(true);
end;

procedure TfrmCadHstContribuicao.bbtnConfirmarClick(Sender: TObject);
begin
  clicoumestre := true;
  inherited;
  sbtnBaixaDet.enabled := true;
end;

procedure TfrmCadHstContribuicao.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  sbtnBaixaDet.enabled := true;
  ApresentaLegenda(true);
end;

procedure TfrmCadHstContribuicao.FormCreate(Sender: TObject);
begin
  inherited;
  ApresentaLegenda(true);
end;

procedure TfrmCadHstContribuicao.sbtnExcluiDetClick(Sender: TObject);
var escolha: integer;
begin
  if qrydet.fieldbyname('sitrecebimento').asinteger = 1 then
  begin
    escolha := MsgDlg('O histórico selecionado será marcado como cancelado, não podendo mais ser processado.' +
                      ' Confirma cancelamento?','Erro',mtError,[mbOk,mbHelp],0);
    case escolha of
    1: begin
          qrydet.edit;
          qrydet.fieldbyname('sitrecebimento').asinteger := 9;
          qrydet.post;
          exit;
        end;
    end;
  end;
  baixa := false;
  deletou := true;
  inherited;
  InsertFiario('Exclusão');

end;            //  FormatFloat('0.00',qryDetVALORESPERADO.AsFloat)

procedure TfrmCadHstContribuicao.bbtnOkDetClick(Sender: TObject);
begin
  if clicoumestre then
    clicoudet := false
  else
    clicoudet := true;
  inherited;
  If sbtnInsDet.Down then InsertFiario('Inclusão')
  else InsertFiario('Alteração');
end;

end.
