// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Taffarel Sevaybriker
//  Rotina     : bbtnConfirmarClick
//  Data       : 19/09/2019
//  SIG        : 91496
//  Descrição  : Adicionado o cálculo e inserção do VALORPORTE. 
//------------------------------------------------------------------------------
//  Autor      : Douglas.Siqueira
//  Data       : 05/06/2012
//  Pendencia  : SOL 167529 - KINTANA 1486864
//  Descrição  : Reajuste do Piso - Campo Piso Mercado.
// *****************************************************************************
//  Autor      : Augusto
//  Rotina     : bbtnConfirmarClick(
//  Data       : 19/11/2007
//  Pendencia  : 26685
//  Descrição  : Acerto na pesquisa dos cargos a reajustar 
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : ----
//  Data       : 26.10.2004
//  Pendencia  : ----
//  Descrição  : Pedir regra na tela
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : bbtnConfirmarClick
//  Data       : 15/06/204
//  Pendencia  : 16278
//  Descrição  : Impossibilitar ao usuário de modificar qualquer item enquanto
//               a operação de reajuste estiver sendo executada.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.11.2003
// Alteração   : Inclusão das Opções de Arredondamento 
//------------------------------------------------------------------------------
unit FReajustaCargosPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Mask, DBCtrls,
  Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmReajustaCargosPatro = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    Label2: TLabel;
    qryReajuste: TwwQuery;
    dsPatroPlano: TwwDataSource;
    GroupBox1: TGroupBox;
    dblkpcmbPatroPlano: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    dblkpcmbMesReajuste: TwwDBLookupCombo;
    dbedReajuste: TDBEdit;
    dsReajuste: TwwDataSource;
    lblProgresso: TLabel;
    lblTotalFeito: TLabel;
    qry: TwwQuery;
    qryIns: TwwQuery;
    GroupBox3: TGroupBox;
    dtBase: TCMDateTimePicker;
    rgrpOpcaoArred: TRadioGroup;
    qryRegra: TwwQuery;
    GroupBox4: TGroupBox;
    dblkpcmbRegra: TwwDBLookupCombo;
    dbedNomeRegra: TDBEdit;
    dsRegra: TwwDataSource;
    rgrpTipoReajuste: TRadioGroup;
    qryAux: TwwQuery;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbPatroPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbMesReajusteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure bOnOff(piOpcao : Integer);       
    function Arred(pdValor : Double) : Double; 
  public
    { Public declarations }
  end;

var
  frmReajustaCargosPatro: TfrmReajustaCargosPatro;

implementation

uses UAdmPrev, UPCS, DBaseDados, UMensErro, UDataBase, UModulo;

{$R *.DFM}

procedure TfrmReajustaCargosPatro.qryPatroAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not qryPatro.Active then Exit;
  qryReajuste.Close;
  qryReajuste.ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldbyName('IDPESSJUR').AsInteger;
  qryReajuste.Open;
end;

procedure TfrmReajustaCargosPatro.dblkpcmbPatroPlanoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryReajuste.Close;
  qryReajuste.ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldbyName('IDPESSJUR').AsInteger;
  qryReajuste.Open;

  dbedNomeRegra.Text := '';
  dblkpcmbRegra.Text := '';

end;

procedure TfrmReajustaCargosPatro.bbtnConfirmarClick(Sender: TObject);
var i                : integer;
    dValorAtual      : double;
    dValorPiso       : double;///douglas.siqueira SOL 167529 - KINTANA 1486864
    dValorPisoReajustado  : double;///douglas.siqueira SOL 167529 - KINTANA 1486864
    dValorReajustado : double;
    dValorPorteReajustado : double; //TAES - SIG91496
    dValorPorte           : double; //TAES - SIG91496
    sValorRegra      : string;
    sSQL             : string;
    bErro            : boolean;
    iSeqFaixa        : longint;

    iIdNivel         : Integer;

begin
dValorPiso:=0;///douglas.siqueira SOL 167529 - KINTANA 1486864
dValorPisoReajustado:=0;///douglas.siqueira SOL 167529 - KINTANA 1486864
  // Testar campos obrigatórios
  if Trim(dblkpcmbPatroPlano.Text) = '' then begin
     MsgDlg('Selecione a Patrocinadora.','Erro',mtError,[mbOK],0);
     dblkpcmbPatroPlano.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbMesReajuste.Text) = ''
  then begin
     MsgDlg('Indique o Mês de Reajuste.','Erro',mtError,[mbOK],0);
     dblkpcmbMesReajuste.SetFocus;
     Exit;
  end;

  if Trim(dtBase.Text) = ''
  then begin
     MsgDlg('Indique a Data Base.','Erro',mtError,[mbOK],0);
     dtBase.SetFocus;
     Exit;
  end;
  // Fim do teste dos campos obrigatórios

  inherited;

  // Verificar se já existe reajuste para o mes informado
  if rgrpTipoReajuste.ItemIndex <> 2
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COUNT(*) AS TOTAL FROM FAIXANIVEL  '+
                    ' WHERE   IDPESSJUR = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                    ' AND     TO_CHAR(DATAEFETIVACAO,''DD/MM/YYYY'') = '''+dtBase.Text+'''');
     qryAux.Open;
     if (not qryAux.IsEmpty) and (qryAux.FieldByName('TOTAL').AsInteger > 0)
     then begin
        MsgDlg('Já existe um reajuste de cargos processado para esta data base.   '+#13+
               'Caso deseje reprocessar o reajuste, utilize o botão Desfazer para '+#13+
               'apagar o reajuste já processado.','Informação',mtInformation,[mbOK],0);
        Exit;
     end;
  end;
  if rgrpTipoReajuste.ItemIndex <> 1
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COUNT(*) AS TOTAL FROM FAIXAGRUPO  '+
                    ' WHERE   IDPESSJUR = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                    ' AND     TO_CHAR(DATAEFETIVACAO,''DD/MM/YYYY'') = '''+dtBase.Text+'''');
     qryAux.Open;
     if (not qryAux.IsEmpty) and (qryAux.FieldByName('TOTAL').AsInteger > 0)
     then begin
        MsgDlg('Já existe um reajuste de funções processado para esta data base.   '+#13+
               'Caso deseje reprocessar o reajuste, utilize o botão Desfazer para '+#13+
               'apagar o reajuste já processado.','Informação',mtInformation,[mbOK],0);
        Exit;
     end;
  end;
  // Fim do verificar se já existe reajuste para o mes informado

  bOnOff(0); 

  dtmBaseDados.dbBaseDados.StartTransaction;

  if rgrpTipoReajuste.ItemIndex <> 2 // diferente de apenas funcoes
  then begin

     // Reajustar Cargos na tabela faixanivel
     with qry do
     begin
        Close;
        SQL.Clear;

        SQL.Add(' SELECT C.IDCARGOEXT, CE.CODIGO, CE.TIPO, C.IDNIVEL, C.DATAVIGENCIA, P.CODIGO AS CODPCS '+
                ' FROM CARGOEXT CE, CARGOXNIVEL C, PCS P                                                 '+
                ' WHERE  CE.IDPESSJUR    = '+qryPatro.FieldbyName('IDPESSJUR').AsString +
                ' AND    ((CE.ULTMESPROC < '''+qryReajuste.FieldByname('MESREAJ').AsString+''') OR (CE.ULTMESPROC IS NULL) )'+
                ' AND    C.IDPESSJUR = CE.IDPESSJUR                              '+
                ' AND    C.IDCARGOEXT = CE.IDCARGOEXT                            '+
                ' AND    TO_CHAR(C.DATAVIGENCIA,''YYYY/MM'') <= '''+qryReajuste.FieldByname('MESREAJ').AsString+''''+
                { CPrev Augusto 19/11/2007                                     }
                //' AND    ((C.DATAFIM IS NULL) OR (C.DATAFIM >='''+qryReajuste.FieldByname('MESREAJ').AsString+'''))'+
                ' AND    ((C.DATAFIM IS NULL) OR (TO_CHAR(C.DATAFIM,''YYYY/MM'') >='''+qryReajuste.FieldByname('MESREAJ').AsString+''')) '+
                ' AND    P.IDPCS(+) = CE.IDPCS '+
                ' ORDER BY C.IDNIVEL '
                );
        Open;
        i := 0;

        iIdNivel := -1;

        while not Eof do
        begin
           dValorAtual := BuscaValorCARGO( qryPatro.FieldbyName('IDPESSJUR').AsInteger,
                                           FieldByName('IDCARGOEXT').AsInteger,
                                           FieldByName('DATAVIGENCIA').AsString,
                                           '01/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,6,2)+'/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,1,4) );


           
           if (Trim(dblkpcmbRegra.Text) = '') and (qryReajuste.FieldByName('PERCENTUAL').AsFloat > 0)
           then begin // reajustar aplicando percentual
              dValorReajustado := dValorAtual + (dValorAtual * qryReajuste.FieldByName('PERCENTUAL').AsFloat / 100);
           end
           else begin // reajustar executando regra

              sSQL := ' SELECT '+OraNumero(FloatToStr(dValorAtual))                +' AS VALORATUAL, '+
                                 FieldByName('IDCARGOEXT').AsString                +' AS IDCARGOEXT, '+
                                 FieldByName('IDNIVEL').AsString                   +' AS IDNIVEL,    '+
                                 ''''+FieldByName('CODIGO').AsString             +''' AS CODIGO,     '+ 
                                 ''''+FieldByName('CODPCS').AsString             +''' AS CODPCS,     '+ 
                                 '''C''                                               AS TIPO,       '+ 
                                 qryPatro.FieldbyName('IDPESSJUR').AsString        +' AS IDPESSJUR,  '+
                                 ''''+qryReajuste.FieldByname('MESREAJ').AsString+''' AS MESREAJ     '+
                      ' FROM DUAL ';

              if (Trim(dblkpcmbRegra.Text) = '')
              then sValorRegra := RegraNumerica( qryReajuste.FieldByName('IDRGREAJ').AsString,
                                                 sSQL,
                                                 bErro,
                                                 iIdCalculoGeral)
              else sValorRegra := RegraNumerica( qryRegra.FieldByName('IDREGRA').AsString,
                                                 sSQL,
                                                 bErro,
                                                 iIdCalculoGeral);
              dValorReajustado := StrToFloat(ClienteNumero(sValorRegra));
           end;
           

           
           // 0 - Utilizar EXATAMENTE o valor calculado
           // 1 - TRUNCAR o valor calculado sem decimais ( apenas parte inteiro. Ex. 123,04 -> 123,00 )
           // 2 - ARREDONDAR o valor calculado em 2 decimais
           // 3 - ARREDONDAR o valor calculado sem decimais ( próximo número inteiro. Ex. 123,04 -> 124,00 )
           case rgrpOpcaoArred.ItemIndex of
                0 : dValorReajustado := dValorReajustado;
                1 : dValorReajustado := Trunc(dValorReajustado);
                
                2 : dValorReajustado := Arred(dValorReajustado); 
                3 : begin
                       if Frac(dValorReajustado) > 0
                       then dValorReajustado := Trunc(dValorReajustado) + 1
                       else dValorReajustado := dValorReajustado;
                    end;
           end;

           { CPrev Inicio Augusto 22/11/2007                                   }

           { Como o nível é o mesmo para todos os cargos, atualizar cada nível }
           { apenas uma vez.                                                   }

           If ( iIdNivel <> Qry.FieldByName('IDNIVEL').AsInteger ) Then
           Begin

           iSeqFaixa := LeUltRegistro(nil,'FAIXANIVEL');

           qryIns.SQL.Text := ' INSERT INTO FAIXANIVEL (IDPESSJUR,IDNIVEL,IDFAIXASALEXT, '+
                              '                         DATAEFETIVACAO,VALOR)            '+
                              ' VALUES (                                                 '+
                              qryPatro.FieldbyName('IDPESSJUR').AsString+             ', '+
                              FieldByName('IDNIVEL').AsString+                        ', '+
                              IntToStr(iSeqFaixa)+                                    ', '+
                              ' TO_DATE('''+dtBase.Text+''',''DD/MM/YYYY'')            , '+
                              OraNumero(FloatToStr(dValorReajustado))+                ') ';
           try
              qryIns.ExecSQL;
           except
              dtmBaseDados.dbBaseDados.RollBack;
              bOnOff(1); 
              MsgDlg('Erro ao inserir novo valor de cargo. Verifique.','Erro',mtError,[mbOK],0);
              Abort;
           end;

           End;

           iIdNivel := Qry.FieldByName('IDNIVEL').AsInteger;

           { CPrev Fim Augusto 22/11/2007                                      }

           qryIns.SQL.Text := ' UPDATE CARGOEXT SET ULTMESPROC = '''+qryReajuste.FieldByname('MESREAJ').AsString+''''+
                              ' WHERE  IDPESSJUR  = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                              ' AND    IDCARGOEXT = '+FieldByName('IDCARGOEXT').AsString;
           try
              qryIns.ExecSQL;
           except
              dtmBaseDados.dbBaseDados.RollBack;
              bOnOff(1); 
              MsgDlg('Erro ao atualizar tabela de cargo. Verifique.','Erro',mtError,[mbOK],0);
              Abort;
           end;

           inc(i);
           lblProgresso.Caption := 'Reajustando CARGO - Código : '+FieldByName('CODIGO').AsString;
           lblTotalFeito.Caption := 'Total de Cargos / Funções Reajustadas : '+IntToStr(i);
           Application.ProcessMessages;

           Next;

        end;
     end;

     GravaLogTotalPREV('Reajuste da Tabela de Cargos-Patro:'+Trim(dblkpcmbPatroPlano.Text)+'-Mês:'+Trim(qryReajuste.FieldByname('MESREAJ').AsString)+'-Regra:'+dblkpcmbRegra.Text); 
  end; 

  if rgrpTipoReajuste.ItemIndex <> 1 // diferente de apenas cargos
  then begin
     // Reajustar FUNCOES COM GRUPO na tabela FAIXAGRUPO
     with qry do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT C.IDCARGOEXT, CE.CODIGO, CE.TIPO, C.IDGRUPOFUNC, C.DATAVIGENCIA '+
                ' FROM   CARGOEXT CE, GRUPOCARGOEXT C  '+
                ' WHERE  CE.IDPESSJUR    = '+qryPatro.FieldbyName('IDPESSJUR').AsString +
                ' AND    ((CE.ULTMESPROC < '''+qryReajuste.FieldByname('MESREAJ').AsString+''') OR (CE.ULTMESPROC IS NULL) )'+             ' AND    C.IDPESSJUR = CE.IDPESSJUR                              '+
                ' AND    C.IDCARGOEXT = CE.IDCARGOEXT                            '+
                ' AND    TO_CHAR(C.DATAVIGENCIA,''YYYY/MM'') <= '''+qryReajuste.FieldByname('MESREAJ').AsString+''''+

                { CPrev Augusto 19/11/2007                                     }
                //' AND    ((C.DATAFIM IS NULL) OR (C.DATAFIM >='''+qryReajuste.FieldByname('MESREAJ').AsString+'''))')
                ' AND    ((C.DATAFIM IS NULL) OR (TO_CHAR(C.DATAFIM,''YYYY/MM'') >='''+qryReajuste.FieldByname('MESREAJ').AsString+''')) ')
                ;
        Open;

        while not Eof do
        begin

           
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' SELECT DATAEFETIVACAO FROM FAIXAGRUPO '+
                          ' WHERE  IDGRUPOFUNC = '+FieldByName('IDGRUPOFUNC').AsString+
                          ' AND    TO_CHAR(DATAEFETIVACAO,''DD/MM/YYYY'') = '''+dtBase.Text+'''');
           qryAux.Open;
           if not qryAux.IsEmpty
           then begin

              qryIns.SQL.Text := ' UPDATE CARGOEXT SET ULTMESPROC = '''+qryReajuste.FieldByname('MESREAJ').AsString+''''+
                                 ' WHERE  IDPESSJUR  = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                                 ' AND    IDCARGOEXT = '+FieldByName('IDCARGOEXT').AsString;
              try
                 qryIns.ExecSQL;
              except
                 dtmBaseDados.dbBaseDados.RollBack;
                 bOnOff(1); 
                 MsgDlg('Erro ao atualizar tabela de cargo. Verifique.','Erro',mtError,[mbOK],0);
                 Abort;
              end;

              Next;
              continue;
           end;
           


           dValorAtual := BuscaValorFUNCAO( qryPatro.FieldbyName('IDPESSJUR').AsInteger,
                                           FieldByName('IDCARGOEXT').AsInteger,
                                           '01/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,6,2)+'/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,1,4) );

           
           if (Trim(dblkpcmbRegra.Text) = '') and (qryReajuste.FieldByName('PERCENTUAL').AsFloat > 0)
           then begin // reajustar aplicando percentual
              dValorReajustado := dValorAtual + (dValorAtual * qryReajuste.FieldByName('PERCENTUAL').AsFloat / 100);
           end
           else begin // reajustar executando regra
              sSQL := ' SELECT '+OraNumero(FloatToStr(dValorAtual))                +' AS VALORATUAL,  '+
                                 FieldByName('IDCARGOEXT').AsString                +' AS IDCARGOEXT,  '+
                                 FieldByName('IDGRUPOFUNC').AsString               +' AS IDGRUPOFUNC, '+
                                 qryPatro.FieldbyName('IDPESSJUR').AsString        +' AS IDPESSJUR,   '+
                                 '''F''                                               AS TIPO,        '+ 
                                 ''''+qryReajuste.FieldByname('MESREAJ').AsString+''' AS MESREAJ      '+
                      ' FROM DUAL ';

              if (Trim(dblkpcmbRegra.Text) = '')
              then sValorRegra := RegraNumerica( qryReajuste.FieldByName('IDRGREAJ').AsString,
                                                 sSQL,
                                                 bErro,
                                                 iIdCalculoGeral)
              else sValorRegra := RegraNumerica( qryRegra.FieldByName('IDREGRA').AsString,
                                                 sSQL,
                                                 bErro,
                                                 iIdCalculoGeral);
              dValorReajustado := StrToFloat(ClienteNumero(sValorRegra));
           end;

           // 0 - Utilizar EXATAMENTE o valor calculado
           // 1 - TRUNCAR o valor calculado sem decimais ( apenas parte inteiro. Ex. 123,04 -> 123,00 )
           // 2 - ARREDONDAR o valor calculado em 2 decimais
           // 3 - ARREDONDAR o valor calculado sem decimais ( próximo número inteiro. Ex. 123,04 -> 124,00 )
           case rgrpOpcaoArred.ItemIndex of
                0 : dValorReajustado := dValorReajustado;
                1 : dValorReajustado := Trunc(dValorReajustado);

                2 : dValorReajustado := Arred(dValorReajustado); 
                3 : begin
                       if Frac(dValorReajustado) > 0
                       then dValorReajustado := Trunc(dValorReajustado) + 1
                       else dValorReajustado := dValorReajustado;
                    end;
           end;


////douglas.siqueira SOL 167529 - KINTANA 1486864

dValorPiso:=0;///douglas.siqueira
dValorPisoReajustado:=0;///douglas.siqueira
  // Testar campos obrigatórios

           dValorPiso := BuscaPisoMercadoFUNCAO( qryPatro.FieldbyName('IDPESSJUR').AsInteger,
                                           FieldByName('IDCARGOEXT').AsInteger,
                                           '01/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,6,2)+'/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,1,4) );


           if (Trim(dblkpcmbRegra.Text) = '') and (qryReajuste.FieldByName('PERCENTUAL').AsFloat > 0)
           then begin // reajustar aplicando percentual
              dValorPisoReajustado := dValorPiso + (dValorPiso * qryReajuste.FieldByName('PERCENTUAL').AsFloat / 100);
           end
           else begin // reajustar executando regra
              sSQL := ' SELECT '+OraNumero(FloatToStr(dValorPiso))                +' AS VALORATUAL,  '+
                                 FieldByName('IDCARGOEXT').AsString                +' AS IDCARGOEXT,  '+
                                 FieldByName('IDGRUPOFUNC').AsString               +' AS IDGRUPOFUNC, '+
                                 qryPatro.FieldbyName('IDPESSJUR').AsString        +' AS IDPESSJUR,   '+
                                 '''F''                                               AS TIPO,        '+ 
                                 ''''+qryReajuste.FieldByname('MESREAJ').AsString+''' AS MESREAJ      '+
                      ' FROM DUAL ';

              if (Trim(dblkpcmbRegra.Text) = '')
              then sValorRegra := RegraNumerica( qryReajuste.FieldByName('IDRGREAJ').AsString,
                                                 sSQL,
                                                 bErro,
                                                 iIdCalculoGeral)
              else sValorRegra := RegraNumerica( qryRegra.FieldByName('IDREGRA').AsString,
                                                 sSQL,
                                                 bErro,
                                                 iIdCalculoGeral);
              dValorPisoReajustado := StrToFloat(ClienteNumero(sValorRegra));
           end;

           // 0 - Utilizar EXATAMENTE o valor calculado
           // 1 - TRUNCAR o valor calculado sem decimais ( apenas parte inteiro. Ex. 123,04 -> 123,00 )
           // 2 - ARREDONDAR o valor calculado em 2 decimais
           // 3 - ARREDONDAR o valor calculado sem decimais ( próximo número inteiro. Ex. 123,04 -> 124,00 )
           case rgrpOpcaoArred.ItemIndex of
                0 : dValorPisoReajustado := dValorPisoReajustado;
                1 : dValorPisoReajustado := Trunc(dValorPisoReajustado);
                
                2 : dValorPisoReajustado := Arred(dValorPisoReajustado);
                3 : begin
                       if Frac(dValorPisoReajustado) > 0
                       then dValorPisoReajustado := Trunc(dValorPisoReajustado) + 1
                       else dValorPisoReajustado := dValorPisoReajustado;
                    end;
           end;

///douglas.siqueira SOL 167529 - KINTANA 1486864

           //TAES - SIG91496 - início
           dValorPorteReajustado := 0;
           dValorPorte           := 0;

           dValorPorte := BuscaValorPORTE( qryPatro.FieldbyName('IDPESSJUR').AsInteger,
                                           FieldByName('IDCARGOEXT').AsInteger,
                                           '01/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,6,2)+'/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,1,4) );

           
           if (Trim(dblkpcmbRegra.Text) = '') and (qryReajuste.FieldByName('PERCENTUAL').AsFloat > 0)
           then begin // reajustar aplicando percentual
              dValorPorteReajustado := dValorPorte + (dValorPorte * qryReajuste.FieldByName('PERCENTUAL').AsFloat / 100);
           end
           else begin // reajustar executando regra
              sSQL := ' SELECT '+OraNumero(FloatToStr(dValorPorte))                +' AS VALORATUAL,  '+
                                 FieldByName('IDCARGOEXT').AsString                +' AS IDCARGOEXT,  '+
                                 FieldByName('IDGRUPOFUNC').AsString               +' AS IDGRUPOFUNC, '+
                                 qryPatro.FieldbyName('IDPESSJUR').AsString        +' AS IDPESSJUR,   '+
                                 '''F''                                               AS TIPO,        '+ 
                                 ''''+qryReajuste.FieldByname('MESREAJ').AsString+''' AS MESREAJ      '+
                      ' FROM DUAL ';

              if (Trim(dblkpcmbRegra.Text) = '')
              then sValorRegra := RegraNumerica( qryReajuste.FieldByName('IDRGREAJ').AsString,
                                                 sSQL,
                                                 bErro,
                                                 iIdCalculoGeral)
              else sValorRegra := RegraNumerica( qryRegra.FieldByName('IDREGRA').AsString,
                                                 sSQL,
                                                 bErro,
                                                 iIdCalculoGeral);
              dValorPorteReajustado := StrToFloat(ClienteNumero(sValorRegra));
           end;

           // 0 - Utilizar EXATAMENTE o valor calculado
           // 1 - TRUNCAR o valor calculado sem decimais ( apenas parte inteiro. Ex. 123,04 -> 123,00 )
           // 2 - ARREDONDAR o valor calculado em 2 decimais
           // 3 - ARREDONDAR o valor calculado sem decimais ( próximo número inteiro. Ex. 123,04 -> 124,00 )
           case rgrpOpcaoArred.ItemIndex of
                0 : dValorPorteReajustado := dValorPorteReajustado;
                1 : dValorPorteReajustado := Trunc(dValorPorteReajustado);

                2 : dValorPorteReajustado := Arred(dValorPorteReajustado);
                3 : begin
                       if Frac(dValorPorteReajustado) > 0
                       then dValorPorteReajustado := Trunc(dValorPorteReajustado) + 1
                       else dValorPorteReajustado := dValorPorteReajustado;
                    end;
           end;
           //TAES - SIG91496 - fim

           iSeqFaixa := LeUltRegistro(nil,'FAIXAGRUPO');
           qryIns.SQL.Text := ' INSERT INTO FAIXAGRUPO (IDPESSJUR,IDGRUPOFUNC, IDFAIXASALEXT, '+
                              '                         DATAEFETIVACAO,VALOR,PISOMERCADO,VALORPORTE)            '+ //TAES - SIG91496
                              ' VALUES (                                                 '+
                              qryPatro.FieldbyName('IDPESSJUR').AsString+             ', '+
                              FieldByName('IDGRUPOFUNC').AsString+                        ', '+
                              IntToStr(iSeqFaixa)+                                    ', '+
                              ' TO_DATE('''+dtBase.Text+''',''DD/MM/YYYY'')            , '+
                              OraNumero(FloatToStr(dValorReajustado))+               ', '+
                              OraNumero(FloatToStr(dValorPisoReajustado))+           ','+     //') ';  ///douglas.siqueira SOL 167529 - KINTANA 1486864
                              OraNumero(FloatToStr(dValorPorteReajustado))+          ')'; //TAES - SIG91496
           try
              qryIns.ExecSQL;
           except
              dtmBaseDados.dbBaseDados.RollBack;
              bOnOff(1); 
              MsgDlg('Erro ao inserir novo valor de função. Verifique.','Erro',mtError,[mbOK],0);
              Abort;
           end;

           qryIns.SQL.Text := ' UPDATE CARGOEXT SET ULTMESPROC = '''+qryReajuste.FieldByname('MESREAJ').AsString+''''+
                              ' WHERE  IDPESSJUR  = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                              ' AND    IDCARGOEXT = '+FieldByName('IDCARGOEXT').AsString;
           try
              qryIns.ExecSQL;
           except
              dtmBaseDados.dbBaseDados.RollBack;
              bOnOff(1); 
              MsgDlg('Erro ao atualizar tabela de cargo. Verifique.','Erro',mtError,[mbOK],0);
              Abort;
           end;

           inc(i);
           lblProgresso.Caption := 'Reajustando FUNÇÃO - Código : '+FieldByName('CODIGO').AsString;
           lblTotalFeito.Caption := 'Total de Cargos / Funções Reajustadas : '+IntToStr(i);
           Application.ProcessMessages;
           Next;
        end;
        GravaLogTotalPREV('Reajuste da Tabela de Funções-Patro:'+Trim(dblkpcmbPatroPlano.Text)+'-Mês:'+Trim(qryReajuste.FieldByname('MESREAJ').AsString)+'-Regra:'+dblkpcmbRegra.Text);
     end;

     // Reajustar FUNCOES SEM GRUPO na tabela FAIXAGRUPO
     with qry do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT CE.IDCARGOEXT, CE.CODIGO, CE.TIPO '+
                ' FROM   CARGOEXT CE                    '+
                ' WHERE  CE.IDPESSJUR    = '+qryPatro.FieldbyName('IDPESSJUR').AsString +
                ' AND    ((CE.ULTMESPROC < '''+qryReajuste.FieldByname('MESREAJ').AsString+''') OR (CE.ULTMESPROC IS NULL) )'+
                ' AND    CE.FLGATIVO     = 1 '+
                ' AND    NOT EXISTS ( SELECT 1 FROM GRUPOCARGOEXT G '+
                '                     WHERE  G.IDCARGOEXT = CE.IDCARGOEXT '+
                '                     AND    TO_CHAR(G.DATAVIGENCIA,''YYYY/MM'') <= '''+qryReajuste.FieldByname('MESREAJ').AsString+''''+
                '                     AND    ((G.DATAFIM IS NULL) OR (TO_CHAR(G.DATAFIM,''YYYY/MM'') >='''+qryReajuste.FieldByname('MESREAJ').AsString+'''))'+///douglas.siqueira SOL 167529 - KINTANA 1486864
//                '                     AND    ((G.DATAFIM IS NULL) OR (G.DATAFIM >='''+qryReajuste.FieldByname('MESREAJ').AsString+'''))'+
                '                    ) ' );
        Open;

        while not Eof do
        begin
           dValorAtual := BuscaValorFUNCAO( qryPatro.FieldbyName('IDPESSJUR').AsInteger,
                                            FieldByName('IDCARGOEXT').AsInteger,
                                            '01/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,6,2)+'/'+Copy(qryReajuste.FieldByname('MESREAJ').AsString,1,4) );

           if qryReajuste.FieldByName('PERCENTUAL').AsFloat > 0
           then begin // reajustar aplicando percentual
              dValorReajustado := dValorAtual + (dValorAtual * qryReajuste.FieldByName('PERCENTUAL').AsFloat / 100);
           end
           else begin // reajustar executando regra
              sSQL := ' SELECT '+OraNumero(FloatToStr(dValorAtual))                 +' AS VALORATUAL, '+
                                 FieldByName('IDCARGOEXT').AsString                 +' AS IDCARGOEXT, '+
                                 qryPatro.FieldbyName('IDPESSJUR').AsString         +' AS IDPESSJUR,  '+
                                 '''F''                                                AS TIPO,       '+ 
                                 ''''+qryReajuste.FieldByname('MESREAJ').AsString+'''  AS MESREAJ     '+
                      ' FROM DUAL ';

              sValorRegra := RegraNumerica( qryReajuste.FieldByName('IDRGREAJ').AsString,
                                            sSQL,
                                            bErro,
                                            iIdCalculoGeral);
              dValorReajustado := StrToFloat(ClienteNumero(sValorRegra));
           end;
           
           // 0 - Utilizar EXATAMENTE o valor calculado
           // 1 - TRUNCAR o valor calculado sem decimais ( apenas parte inteiro. Ex. 123,04 -> 123,00 )
           // 2 - ARREDONDAR o valor calculado em 2 decimais
           // 3 - ARREDONDAR o valor calculado sem decimais ( próximo número inteiro. Ex. 123,04 -> 124,00 )
           case rgrpOpcaoArred.ItemIndex of
                0 : dValorReajustado := dValorReajustado;
                1 : dValorReajustado := Trunc(dValorReajustado);
                
                2 : dValorReajustado := Arred(dValorReajustado); 
                3 : begin
                       if Frac(dValorReajustado) > 0
                       then dValorReajustado := Trunc(dValorReajustado) + 1
                       else dValorReajustado := dValorReajustado;
                    end;
           end;

           iSeqFaixa := LeUltRegistro(nil,'FAIXAFUNCAO');
           qryIns.SQL.Text := ' INSERT INTO FAIXAFUNCAO (IDPESSJUR,IDCARGOEXT, IDFAIXASALEXT, '+
                              '                         DATAEFETIVACAO,VALOR)            '+
                              ' VALUES (                                                 '+
                              qryPatro.FieldbyName('IDPESSJUR').AsString+             ', '+
                              FieldByName('IDCARGOEXT').AsString+                        ', '+
                              IntToStr(iSeqFaixa)+                                    ', '+
                              ' TO_DATE('''+dtBase.Text+''',''DD/MM/YYYY'')            , '+
                              OraNumero(FloatToStr(dValorReajustado))+                ') ';
           try
              qryIns.ExecSQL;
           except
              dtmBaseDados.dbBaseDados.RollBack;
              bOnOff(1); 
              MsgDlg('Erro ao inserir novo valor de função. Verifique.','Erro',mtError,[mbOK],0);
              Abort;
           end;

           qryIns.SQL.Text := ' UPDATE CARGOEXT SET ULTMESPROC = '''+qryReajuste.FieldByname('MESREAJ').AsString+''''+
                              ' WHERE  IDPESSJUR  = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                              ' AND    IDCARGOEXT = '+FieldByName('IDCARGOEXT').AsString;
           try
              qryIns.ExecSQL;
           except
              dtmBaseDados.dbBaseDados.RollBack;
              bOnOff(1); 
              MsgDlg('Erro ao atualizar tabela de cargo. Verifique.','Erro',mtError,[mbOK],0);
              Abort;
           end;

           inc(i);
           lblProgresso.Caption := 'Reajustando FUNÇÃO - Código : '+FieldByName('CODIGO').AsString;
           lblTotalFeito.Caption := 'Total de Cargos / Funções Reajustadas : '+IntToStr(i);
           Application.ProcessMessages;
           Next;
        end;
     end;
  end;

  dtmBaseDados.dbBaseDados.Commit;
  MsgDlg('Reajuste de Cargos e Funções efetuado com sucesso.','Informação',mtInformation,[mbOK],0);

  bOnOff(1); 

end;


procedure TfrmReajustaCargosPatro.bOnOff(piOpcao: Integer);
begin
  pnlFundo.Enabled       := (piOpcao = 1);
  tb97Fundo.Enabled      := (piOpcao = 1);
  TB97oKCancelar.Enabled := (piOpcao = 1);
end;

function TfrmReajustaCargosPatro.Arred(pdValor: Double): Double;
begin
  Result := (Trunc(pdValor*100))/100;
end;


procedure TfrmReajustaCargosPatro.FormShow(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;

  qryReajuste.Close;
  qryReajuste.ParamByName('IDPESSJUR').AsInteger := -1;
  qryReajuste.Open;

  qryRegra.Close;
  qryRegra.Open;

  dbedNomeRegra.Text := '';
  dblkpcmbRegra.Text := '';
  lblProgresso.Visible := False;

end;

procedure TfrmReajustaCargosPatro.dblkpcmbMesReajusteCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblkpcmbMesReajuste.Text := qryReajuste.FieldByname('MESREAJ').AsString;
end;

procedure TfrmReajustaCargosPatro.bbtnCancelarClick(Sender: TObject);
var sUltReajuste : string;
begin
  // Testar campos obrigatórios
  if Trim(dblkpcmbPatroPlano.Text) = ''
  then begin
     MsgDlg('Selecione a Patrocinadora.','Erro',mtError,[mbOK],0);
     dblkpcmbPatroPlano.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbMesReajuste.Text) = ''
  then begin
     MsgDlg('Indique o Mês de Reajuste.','Erro',mtError,[mbOK],0);
     dblkpcmbMesReajuste.SetFocus;
     Exit;
  end;

  if Trim(dtBase.Text) = ''
  then begin
     MsgDlg('Indique a Data Base.','Erro',mtError,[mbOK],0);
     dtBase.SetFocus;
     Exit;
  end;
  // Fim do teste dos campos obrigatórios

  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;

  if rgrpTipoReajuste.ItemIndex <> 2 // diferente de apenas funcoes
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' DELETE FAIXANIVEL '+
                    ' WHERE   IDPESSJUR = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                    ' AND     TO_CHAR(DATAEFETIVACAO,''DD/MM/YYYY'') = '''+dtBase.Text+'''');
     try
        qryAux.ExecSQL;
     except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Erro ao excluir tabela de faixas dos níveis salariais. Verifique.','Erro',mtError,[mbOK],0);
        Abort;
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT MAX(DATAEFETIVACAO) AS DATAEFETIVACAO FROM FAIXANIVEL '+
                    ' WHERE   IDPESSJUR  = '+qryPatro.FieldbyName('IDPESSJUR').AsString);
     qryAux.Open;
     if not qryAux.IsEmpty
     then sUltReajuste := Copy(qryAux.FieldByName('DATAEFETIVACAO').AsString,7,4)+'/'+Copy(qryAux.FieldByName('DATAEFETIVACAO').AsString,4,2)
     else sUltReajuste := '0000/00';

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' UPDATE CARGOEXT SET ULTMESPROC = '''+sUltReajuste+''''+
                    ' WHERE   IDPESSJUR  = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                    ' AND     TIPO       = ''C'' '+
                    ' AND     ULTMESPROC = '''+Copy(dtBase.Text,7,4)+'/'+Copy(dtBase.Text,4,2)+'''');
     try
        qryAux.ExecSQL;
     except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Erro ao atualizar tabela de cargos. Verifique.','Erro',mtError,[mbOK],0);
        Abort;
     end;
  end;

  if rgrpTipoReajuste.ItemIndex <> 1 // diferente de apenas cargos
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' DELETE FAIXAGRUPO '+
                    ' WHERE   IDPESSJUR = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                    ' AND     TO_CHAR(DATAEFETIVACAO,''DD/MM/YYYY'') = '''+dtBase.Text+'''');
     try
        qryAux.ExecSQL;
     except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Erro ao excluir tabela de faixas dos grupos de função. Verifique.','Erro',mtError,[mbOK],0);
        Abort;
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT MAX(DATAEFETIVACAO) AS DATAEFETIVACAO FROM FAIXAGRUPO '+
                    ' WHERE   IDPESSJUR  = '+qryPatro.FieldbyName('IDPESSJUR').AsString);
     qryAux.Open;
     if not qryAux.IsEmpty
     then sUltReajuste := Copy(qryAux.FieldByName('DATAEFETIVACAO').AsString,7,4)+'/'+Copy(qryAux.FieldByName('DATAEFETIVACAO').AsString,4,2)
     else sUltReajuste := '0000/00';

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' UPDATE CARGOEXT SET ULTMESPROC = '''+sUltReajuste+''''+
                    ' WHERE   IDPESSJUR  = '+qryPatro.FieldbyName('IDPESSJUR').AsString+
                    ' AND     TIPO       = ''F'' '+
                    ' AND     ULTMESPROC = '''+Copy(dtBase.Text,7,4)+'/'+Copy(dtBase.Text,4,2)+'''');
     try
        qryAux.ExecSQL;
     except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Erro ao atualizar tabela de funções. Verifique.','Erro',mtError,[mbOK],0);
        Abort;
     end;
  end;

  dtmBaseDados.dbBaseDados.Commit;
  MsgDlg('Desfazer Reajuste de Cargos e Funções efetuado com sucesso.','Informação',mtInformation,[mbOK],0);
end;

end.
